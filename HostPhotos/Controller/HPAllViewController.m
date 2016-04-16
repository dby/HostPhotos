//
//  HPAllCollectionViewController.m
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "HPAllViewController.h"

@interface HPAllViewController ()

@end

@implementation HPAllViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[HPViewModel alloc] initWithType:MeiziTypeAll withCollectionView:self.contentCollectView];
    [self initRefreshHeaderAndFooter];
    
    [self.contentCollectView.mj_header beginRefreshing];
}

- (void)initRefreshHeaderAndFooter {
    
    NSLog(@"%s", __func__);
    self.contentCollectView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0);
    MJRefreshNormalHeader *header       = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshMeizi)];
    MJRefreshAutoNormalFooter *footer   = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreMeizi)];
    header.automaticallyChangeAlpha     = YES;
    footer.automaticallyRefresh         = NO;
    
    self.contentCollectView.mj_header = header;
    self.contentCollectView.mj_footer = footer;
}

@end