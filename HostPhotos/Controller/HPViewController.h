//
//  HPViewController.h
//  HostPhotos
//
//  Created by sys on 16/4/16.
//  Copyright © 2016年 sys. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HPConfig.h"
#import "MJRefresh.h"
#import "HPFlowLayout.h"
#import "HPViewModel.h"
#import "HPDataModel.h"
#import "MWPhotoBrowser.h"
#import "HostPhotosRequest.h"
#import "MeiZiCollectionViewCell.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@interface HPViewController : UIViewController

@property (nonatomic, assign) NSInteger off;
@property (nonatomic, assign) NSInteger lim;
@property (nonatomic, assign) BOOL needAutoRefresh;
@property (nonatomic, strong) HPViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *meiziArray;
@property (nonatomic, strong) UICollectionView *contentCollectView;

@property (nonatomic, strong) NSDate *lastRefreshTime;
@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end
