//
//  ViewControllerPrivate.h
//  FlickrSearch
//
//  Created by Steve Baker on 4/18/14.
//  Copyright (c) 2014 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Flickr.h"
#import "FlickrPhoto.h"


@interface ViewController () <UITextFieldDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property(nonatomic, weak) IBOutlet UIToolbar *toolbar;
@property(nonatomic, weak) IBOutlet UIBarButtonItem *shareButton;
@property(nonatomic, weak) IBOutlet UITextField *textField;

@property(nonatomic, strong) NSMutableDictionary *searchResults;
@property(nonatomic, strong) NSMutableArray *searches;
@property(nonatomic, strong) Flickr *flickr;

@property (nonatomic) BOOL sharing;

- (IBAction)shareButtonTapped:(id)sender;

@end