//
//  Flickr.h
//  Flickr Search
//
//  Created by Brandon Trebitowski on 6/28/12.
//  Copyright (c) 2012 Brandon Trebitowski. All rights reserved.
//
// Modified by Steve Baker Beepscore LLC

#import <Foundation/Foundation.h>

@class FlickrPhoto;

typedef void (^FlickrSearchCompletionBlock)(NSString *searchTerm, NSArray *results, NSError *error);
typedef void (^FlickrPhotoCompletionBlock)(UIImage *photoImage, NSError *error);

@interface Flickr : NSObject

@property(strong) NSString *apiKey;

+ (void)loadImageForPhoto:(FlickrPhoto *)flickrPhoto
                thumbnail:(BOOL)thumbnail
          completionBlock:(FlickrPhotoCompletionBlock)completionBlock;

+ (NSURL *)flickrPhotoURLForFlickrPhoto:(FlickrPhoto *)flickrPhoto
                                   size:(NSString *)size;

- (void)searchFlickrForTerm:(NSString *)term
            completionBlock:(FlickrSearchCompletionBlock)completionBlock;

///////////////////////////////////////////////////////////////////////////////
// "private" api. exposed for use by unit tests
+ (NSURL *)flickrSearchURLForSearchTerm:(NSString *)searchTerm;
+ (NSString *)flickrSearchURLStringForSearchTerm:(NSString *)searchTerm;

@end
