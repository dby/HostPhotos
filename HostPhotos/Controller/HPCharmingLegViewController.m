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
    [self initRefreshHeaderAndFooter];
    
    [self.contentCollectView.mj_header beginRefreshing];
    
}

- (void)initRefreshHeaderAndFooter {
    
    NSLog(@"%s", __func__);
    self.contentCollectView.contentInset = UIEdgeInsetsMake(0, 0, 90, 0);
    MJRefreshNormalHeader *header       = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshMeizi)];
    MJRefreshAutoNormalFooter *footer   = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreMeizi)];
    header.automaticallyChangeAlpha     = YES;
    footer.automaticallyRefresh         = NO;
    
    self.contentCollectView.mj_header = header;
    self.contentCollectView.mj_footer = footer;
}

@end
