//
//  StoryboardViewControllerTests.m
//  FlickrSearch
//
//  Created by Steve Baker on 4/18/14.
//  Copyright (c) 2014 Beepscore LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface StoryboardViewControllerTests : XCTestCase
@property ViewController *vc;
@end

@implementation StoryboardViewControllerTests

- (void)setUp
{
    [super setUp];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone"
                                                         bundle:[NSBundle mainBundle]];

    self.vc = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];

    // Call load view to instantiate view and subviews.
    // http://iosunittesting.com/using-storyboards/
    [self.vc performSelectorOnMainThread:@selector(loadView)
                              withObject:nil
                           waitUntilDone:YES];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    //XCTAssertNotNil(self.vc.textField.delegate);
}

@end
