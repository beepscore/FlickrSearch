//
//  FlikrTests.m
//  FlickrSearch
//
//  Created by Steve Baker on 10/22/15.
//  Copyright © 2015 Beepscore LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Flickr.h"

@interface FlikrTests : XCTestCase

@end

@implementation FlikrTests

- (void)testFlickrSearchURLForSearchTerm {
    NSURL *actual = [Flickr flickrSearchURLForSearchTerm:@"owl"];
    NSURL *expected = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=51b82b9d2024fb99592b7989b734c340&text=owl&per_page=20&format=json&nojsoncallback=1"];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testFlickrSearchURLStringForSearchTerm {
    NSString *actual = [Flickr flickrSearchURLStringForSearchTerm:@"owl"];
    NSString *expected = @"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=51b82b9d2024fb99592b7989b734c340&text=owl&per_page=20&format=json&nojsoncallback=1";
    XCTAssertEqualObjects(expected, actual);
}

@end
