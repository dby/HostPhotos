//
//  HPViewModel.m
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "HPViewModel.h"
#import "HPDataModel.h"
#import <MJRefresh.h>

@interface HPViewModel()


@end

@implementation HPViewModel

#pragma mark - Life Cycle

-(instancetype)initWithType:(MeiziType)type withCollectionView:(UICollectionView *)collectionView {
    
    self = [super init];
    if (self) {
        self.type = type;
        self.collectionView = collectionView;
        
        [self initComponents];
        [self initRefreshHeaderAndFooter];
    }
    return self;
}

#pragma mark - Init

-(void)initComponents {
    
    self.dataSource = [[NSMutableArray alloc] init];
    self.needAutoRefresh = true;
}

- (void)initRefreshHeaderAndFooter {
    
    NSLog(@"setupRefreshHeaderAndFooter");
    self.collectionView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0);
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(autoRefresh)];
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(autoRefresh)];
    header.automaticallyChangeAlpha = YES;
    footer.automaticallyRefresh = NO;
    self.collectionView.mj_header = header;
    self.collectionView.mj_footer = footer;
    [self.collectionView.mj_header beginRefreshing];
    
}


#pragma mark - Custom Function
-(void)getData:(NSInteger)off withLim:(NSInteger)lim withSuccessBack:(HPViewModelSuccessBack)successCallBack withErrorCallBack:(HPVieModelErrorCallBack)errorCallBack
{
    self.successCallBack = successCallBack;
    self.errorCallBack = errorCallBack;
    
    [self.collectionView.mj_header beginRefreshing];
    
    HostPhotosRequest *hpr = [[HostPhotosRequest alloc] initWithOff:off meiziLimit:lim meiziCid:_type];
    [hpr startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        NSArray *dataArr = [request.responseJSONObject objectForKey:@"meizi"];
        if ([dataArr count] > 0) {
            if (off == 0) {
                [self.dataSource removeAllObjects];
            }
            
            for (NSDictionary *dic in dataArr) {
                HPDataModel *model = [[HPDataModel alloc] initWithDic:dic];
                [self.dataSource addObject:model];
            }
            
            if (self.successCallBack) {
                self.successCallBack(self.dataSource);
            }
        }
    } failure:^(YTKBaseRequest *request) {
        if (self.errorCallBack) {
            self.errorCallBack(nil);
        }
    }];
}

- (void)autoRefresh {
    if (_needAutoRefresh) {
        
        [self getData:0 withLim:20 withSuccessBack:_successCallBack withErrorCallBack:_errorCallBack];
        
        /*
        _userDefaults = [NSUserDefaults standardUserDefaults];
        _lastRefreshTime = [_userDefaults objectForKey:_kLastRefreshTime];
        
        if (!_lastRefreshTime) {
            _lastRefreshTime = [NSDate date];
            [_userDefaults setObject:_lastRefreshTime forKey:_kLastRefreshTime];
        }
         */
    }
}

@end