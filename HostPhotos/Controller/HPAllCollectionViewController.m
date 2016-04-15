//
//  HPAllCollectionViewController.m
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "HPAllCollectionViewController.h"

#import "HPConfig.h"
#import "MJRefresh.h"
#import "HPFlowLayout.h"
#import "HPViewModel.h"
#import "HPDataModel.h"
#import "MWPhotoBrowser.h"
#import "HostPhotosRequest.h"
#import "MeiZiCollectionViewCell.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@interface HPAllCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, assign) NSInteger off;
@property (nonatomic, assign) NSInteger lim;
@property (nonatomic, assign) BOOL needAutoRefresh;
@property (nonatomic, strong) HPViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *meiziArray;
@property (nonatomic, strong) UICollectionView *contentCollectView;

@property (nonatomic, strong) NSDate *lastRefreshTime;
@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation HPAllCollectionViewController

static NSString * const reuseIdentifier = @"MeiZiCellID";

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initComponent];
    [self autoRefresh];
    
    [self.viewModel getData:_off withLim:_lim withSuccessBack:^(NSArray *datasource) {
        
        _meiziArray = [datasource copy];
        [self.contentCollectView reloadData];
        
    } withErrorCallBack:^(NSError *error) {
        
    }];
}

#pragma mark - Init
- (void)initComponent {
    
    self.lim = 20;
    self.off = 0;
    
    self.meiziArray = [[NSMutableArray alloc] init];
    
    self.viewModel = [[HPViewModel alloc] initWithType:MeiziTypeAll];
    
    HPFlowLayout *collectLayout = [[HPFlowLayout alloc] init];
    self.contentCollectView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:collectLayout];
    
    self.contentCollectView.delegate = self;
    self.contentCollectView.dataSource = self;
    self.contentCollectView.showsVerticalScrollIndicator = true;
    self.contentCollectView.pagingEnabled = true;
    
    [self.contentCollectView registerNib:[UINib nibWithNibName:@"MeiZiCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    [self.view addSubview:self.contentCollectView];
}

- (void)autoRefresh {
    if (_needAutoRefresh) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
        _lastRefreshTime = [_userDefaults objectForKey:@"111"];
        
        if (!_lastRefreshTime) {
            _lastRefreshTime = [NSDate date];
            [_userDefaults setObject:_lastRefreshTime forKey:@"111"];
        }
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.meiziArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MeiZiCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    HPDataModel *meizi = [self.meiziArray objectAtIndex:indexPath.row];
    cell.iconUrl = meizi.imgsrc;
    
    return cell;
}


#pragma mark <UICollectionViewDelegate>

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableArray *photoArray = [NSMutableArray array];
    for (HPDataModel *meizi in self.meiziArray) {
        MWPhoto *photo = [MWPhoto photoWithURL:[NSURL URLWithString:meizi.imgsrc]];
        photo.caption = meizi.title;
        [photoArray addObject:photo];
    }
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithPhotos:photoArray];
    browser.alwaysShowControls = YES;
    [browser setCurrentPhotoIndex:indexPath.row];
    [self.navigationController pushViewController:browser animated:YES];
    
    return YES;
}

@end