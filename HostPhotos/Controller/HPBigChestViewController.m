//
//  HPAllCollectionViewController.m
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "HPBigChestViewController.h"


@interface HPBigChestViewController ()

@end

@implementation HPBigChestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[HPViewModel alloc] initWithType:MeiziTypeDaXiong withCollectionView:self.contentCollectView];
    
    [self.viewModel getData:self.off withLim:self.lim withSuccessBack:^(NSArray *datasource) {
        
        self.meiziArray = [datasource copy];
        [self.contentCollectView reloadData];
        
    } withErrorCallBack:^(NSError *error) {
        
    }];
}

@end
