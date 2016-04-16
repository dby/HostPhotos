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
        
        [self initComponents];
    }
    return self;
}

#pragma mark - Init

-(void)initComponents {
    self.dataSource = [[NSMutableArray alloc] init];
}


#pragma mark - Custom Function
-(void)getData:(NSInteger)off withLim:(NSInteger)lim withSuccessBack:(HPViewModelSuccessBack)successCallBack withErrorCallBack:(HPVieModelErrorCallBack)errorCallBack
{
    self.successCallBack    = successCallBack;
    self.errorCallBack      = errorCallBack;
    
    HostPhotosRequest *hpr = [[HostPhotosRequest alloc] initWithOff:off meiziLimit:lim meiziCid:_type];
    [hpr startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        NSArray *dataArr = [request.responseJSONObject objectForKey:@"meizi"];
        NSLog(@"%@", request.responseJSONObject);
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

@end