//
//  Flickr.m
//  Flickr Search
//
//  Created by Brandon Trebitowski on 6/28/12.
//  Copyright (c) 2012 Brandon Trebitowski. All rights reserved.
//

#import "Flickr.h"
#import "FlickrPhoto.h"

// get temporary key from
// https://www.flickr.com/services/api/explore/?method=flickr.photos.search
// on that page, do a search to get url at bottom of page. Then copy &apiKey up to &
// Alternatively, register with Flickr for a developer key
// https://www.flickr.com/services/api/keys/apply/
// redirects to Yahoo login
#define kFlickrAPIKey @"51b82b9d2024fb99592b7989b734c340"
#define kFlickrAPISig @"ce3140ced04a9ef7ce9c5c2975553b0a"


@implementation Flickr

+ (NSString *)flickrSearchURLForSearchTerm:(NSString *)searchTerm
{
    searchTerm = [searchTerm stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&text=%@&per_page=20&format=json&nojsoncallback=1&api_sig=%@", kFlickrAPIKey, searchTerm, kFlickrAPISig];
}

+ (NSString *)flickrPhotoURLForFlickrPhoto:(FlickrPhoto *)flickrPhoto
                                      size:(NSString *)size
{
    if(!size)
    {
        size = @"m";
    }
    return [NSString stringWithFormat:@"https://farm%ld.staticflickr.com/%ld/%lld_%@_%@.jpg",
            (long)flickrPhoto.farm, (long)flickrPhoto.server,
            flickrPhoto.photoID, flickrPhoto.secret, size];
}

- (void)searchFlickrForTerm:(NSString *)term
            completionBlock:(FlickrSearchCompletionBlock)completionBlock
{
    NSString *searchURL = [Flickr flickrSearchURLForSearchTerm:term];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSError *error = nil;
        NSString *searchResultString = [NSString stringWithContentsOfURL:[NSURL URLWithString:searchURL]
                                                           encoding:NSUTF8StringEncoding
                                                              error:&error];
        if (error != nil) {
            completionBlock(term, nil, error);
        }
        else
        {
            // Parse the JSON Response
            NSData *jsonData = [searchResultString dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *searchResultsDict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                              options:kNilOptions
                                                                                error:&error];
            if(error != nil)
            {
                completionBlock(term, nil, error);
            }
            else
            {
                NSString * status = searchResultsDict[@"stat"];
                if ([status isEqualToString:@"fail"]) {
                    NSError * error = [[NSError alloc] initWithDomain:@"FlickrSearch" code:0 userInfo:@{NSLocalizedFailureReasonErrorKey: searchResultsDict[@"message"]}];
                    completionBlock(term, nil, error);
                } else {
                
                    NSArray *objPhotos = searchResultsDict[@"photos"][@"photo"];
                    NSMutableArray *flickrPhotos = [@[] mutableCopy];
                    for(NSMutableDictionary *objPhoto in objPhotos)
                    {
                        FlickrPhoto *photo = [[FlickrPhoto alloc] init];
                        photo.farm = [objPhoto[@"farm"] intValue];
                        photo.server = [objPhoto[@"server"] intValue];
                        photo.secret = objPhoto[@"secret"];
                        photo.photoID = [objPhoto[@"id"] longLongValue];
                        
                        NSString *searchURL = [Flickr flickrPhotoURLForFlickrPhoto:photo size:@"m"];
                        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:searchURL]
                                                                  options:0
                                                                    error:&error];
                        UIImage *image = [UIImage imageWithData:imageData];
                        photo.thumbnail = image;
                        
                        [flickrPhotos addObject:photo];
                    }
                    
                    completionBlock(term,flickrPhotos,nil);
                }
            }
        }
    });
}

+ (void)loadImageForPhoto:(FlickrPhoto *)flickrPhoto
                thumbnail:(BOOL)thumbnail
          completionBlock:(FlickrPhotoCompletionBlock)completionBlock
{
    
    NSString *size = thumbnail ? @"m" : @"b";
    
    NSString *searchURL = [Flickr flickrPhotoURLForFlickrPhoto:flickrPhoto size:size];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSError *error = nil;
        
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:searchURL]
                                                  options:0
                                                    error:&error];
        if(error)
        {
            completionBlock(nil,error);
        }
        else
        {
            UIImage *image = [UIImage imageWithData:imageData];
            if([size isEqualToString:@"m"])
            {
                flickrPhoto.thumbnail = image;
            }
            else
            {
                flickrPhoto.largeImage = image;
            }
            completionBlock(image,nil);
        }
        
    });
}



@end
