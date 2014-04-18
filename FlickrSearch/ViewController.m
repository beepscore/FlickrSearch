//
//  ViewController.m
//  FlickrSearch
//
//  Created by Steve Baker on 4/17/14.
//  Copyright (c) 2014 Beepscore LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property(nonatomic, weak) IBOutlet UIToolbar *toolbar;
@property(nonatomic, weak) IBOutlet UIBarButtonItem *shareButton;
@property(nonatomic, weak) IBOutlet UITextField *textField;

- (IBAction)shareButtonTapped:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareButtonTapped:(id)sender {
//TODO:
}

@end
