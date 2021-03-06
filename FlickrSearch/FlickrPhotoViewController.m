//
//  FlickrPhotoViewController.m
//  FlickrSearch
//
//  Created by Steve Baker on 4/19/14.
//  Copyright (c) 2014 Beepscore LLC. All rights reserved.
//

#import "FlickrPhotoViewController.h"
#import "FlickrPhotoViewControllerPrivate.h"
#import "Flickr.h"
#import "FlickrPhoto.h"

@interface FlickrPhotoViewController ()

@end

@implementation FlickrPhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {

    if(self.flickrPhoto.largeImage) {
        self.imageView.image = self.flickrPhoto.largeImage;
    } else {
        // if no largeImage, show stretched thumbnail
        self.imageView.image = self.flickrPhoto.thumbnail;
        
        [Flickr loadImageForPhoto:self.flickrPhoto
                        thumbnail:NO
                  completionBlock:^(UIImage *photoImage, NSError *error) {
                      if(!error) {
                          dispatch_async(dispatch_get_main_queue(), ^{
                              self.imageView.image = self.flickrPhoto.largeImage;
                          });
                      }
                  }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{}];
}

@end
