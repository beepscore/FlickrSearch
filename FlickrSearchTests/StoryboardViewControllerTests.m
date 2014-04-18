//
//  StoryboardViewControllerTests.m
//  FlickrSearch
//
//  Created by Steve Baker on 4/18/14.
//  Copyright (c) 2014 Beepscore LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "ViewControllerPrivate.h"
#import "BSStoryboardViewControllerLoader.h"

@interface StoryboardViewControllerTests : XCTestCase
@property ViewController *vc;
@end

@implementation StoryboardViewControllerTests

- (void)setUp
{
    [super setUp];
    
    self.vc = (ViewController *)[BSStoryboardViewControllerLoader
                                 viewControllerWithStoryboardName:@"Main_iPhone"
                                 identifier:@"ViewController"];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testViewControllerTextField
{
    XCTAssertNotNil(self.vc.textField);
}

@end
