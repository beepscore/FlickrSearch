//
//  ViewController.m
//  FlickrSearch
//
//  Created by Steve Baker on 4/17/14.
//  Copyright (c) 2014 Beepscore LLC. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerPrivate.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureUI];

    self.searches = [@[] mutableCopy];
    self.searchResults = [@{} mutableCopy];
    self.flickr = [[Flickr alloc] init];
}

- (void)configureUI
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_cork.png"]];
    
    UIImage *navBarImage = [[UIImage imageNamed:@"navbar.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(27, 27, 27, 27)];
    
    [self.toolbar setBackgroundImage:navBarImage
                  forToolbarPosition:UIToolbarPositionAny
                          barMetrics:UIBarMetricsDefault];
    
    UIImage *shareButtonImage = [[UIImage imageNamed:@"button.png"]
                                 resizableImageWithCapInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
    [self.shareButton setBackgroundImage:shareButtonImage
                                forState:UIControlStateNormal
                              barMetrics:UIBarMetricsDefault];
    
    UIImage *textFieldImage = [[UIImage imageNamed:@"search_field.png"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [self.textField setBackground:textFieldImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareButtonTapped:(id)sender {
//TODO:
}

#pragma mark - UITextFieldDelegate methods
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    // 1
    [self.flickr searchFlickrForTerm:textField.text
                     completionBlock:^(NSString *searchTerm, NSArray *results, NSError *error) {
                         if(results && [results count] > 0) {
                             
                             if(![self.searches containsObject:searchTerm]) {
                                 // haven't searched for this term before
                                 NSLog(@"Found %d photos matching %@", [results count],searchTerm);
                                 [self.searches insertObject:searchTerm atIndex:0];
                                 self.searchResults[searchTerm] = results;
                             }
                             // 3
                             dispatch_async(dispatch_get_main_queue(), ^{
                                 // Placeholder: reload collectionview data
                             });
                         } else {
                             NSLog(@"Error searching Flickr: %@", error.localizedDescription);
                         }
                     }];
    
    [textField resignFirstResponder];
    return YES; 
}

@end
