//
//  BSStoryboardViewControllerLoader.m
//  FlickrSearch
//
//  Created by Steve Baker on 4/18/14.
//  Copyright (c) 2014 Beepscore LLC. All rights reserved.
//

#import "BSStoryboardViewControllerLoader.h"

@implementation BSStoryboardViewControllerLoader

+ (UIViewController *)viewControllerWithStoryboardName:(NSString *)storyboardName
                                            identifier:(NSString *)identifier {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName
                                                         bundle:[NSBundle mainBundle]];
    
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    
    // Call load view to instantiate view and subviews.
    // http://iosunittesting.com/using-storyboards/
    [viewController performSelectorOnMainThread:@selector(loadView)
                                     withObject:nil
                                  waitUntilDone:YES];
    return viewController;
}

@end
