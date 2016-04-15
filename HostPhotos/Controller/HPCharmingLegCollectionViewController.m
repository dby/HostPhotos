//
//  HPAllCollectionViewController.m
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "HPCharmingLegCollectionViewController.h"

#import "HPConfig.h"
#import "HPDataModel.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@interface HPCharmingLegCollectionViewController ()

@property (nonatomic, strong) NSMutableArray *meiziArray;

@end

@implementation HPCharmingLegCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.collectionView registerClass:[MeiziCell class] forCellWithReuseIdentifier:@"MeiziCell"];
    
}

@end
