//
//  HPAllCollectionViewController.m
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "HPCharmingLegViewController.h"

@interface HPCharmingLegViewController ()

@end

@implementation HPCharmingLegViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[HPViewModel alloc] initWithType:MeiziTypeMeiTui withCollectionView:self.contentCollectView];
    
    [self.viewModel getData:self.off withLim:self.lim withSuccessBack:^(NSArray *datasource) {
        
        self.meiziArray = [datasource copy];
        [self.contentCollectView reloadData];
        
    } withErrorCallBack:^(NSError *error) {
        
    }];
    
}

@end
