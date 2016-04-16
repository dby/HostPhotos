//
//  HPAllCollectionViewController.m
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "HPBlackStockingViewController.h"

@interface HPBlackStockingViewController()

@end

@implementation HPBlackStockingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[HPViewModel alloc] initWithType:MeiziTypeHeisi withCollectionView:self.contentCollectView];
    [self initRefreshHeaderAndFooter];
    
    [self.contentCollectView.mj_header beginRefreshing];
    
}

- (void)initRefreshHeaderAndFooter {
    
    NSLog(@"%s", __func__);
    MJRefreshNormalHeader *header       = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshMeizi)];
    MJRefreshAutoNormalFooter *footer   = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreMeizi)];
    header.automaticallyChangeAlpha     = YES;
    footer.automaticallyRefresh         = NO;
    
    self.contentCollectView.mj_header = header;
    self.contentCollectView.mj_footer = footer;
}

@end