//
//  HPViewModel.m
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "HPViewModel.h"
#import "HPDataModel.h"

@implementation HPViewModel

-(instancetype)initWithType:(MeiziType)type {
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}

-(void)getData:(NSInteger)off withLim:(NSInteger)lim withSuccessBack:(HPViewModelSuccessBack)successCallBack withErrorCallBack:(HPVieModelErrorCallBack)errorCallBack
{
    self.successCallBack = successCallBack;
    self.errorCallBack = errorCallBack;
    
    HostPhotosRequest *hpr = [[HostPhotosRequest alloc] initWithOff:off meiziLimit:lim meiziCid:_type];
    // 开始刷新
    [hpr startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        
        NSArray *dataArr = [request.responseJSONObject objectForKey:@"meizi"];
        NSLog(@"json_object: %@", request.responseJSONObject);
        if ([dataArr count] > 0) {
            if (off == 0) {
                [self.dataSource removeAllObjects];
            }
            
            // 字典转模型
            for (NSDictionary *dic in dataArr) {
                HPDataModel *model = [[HPDataModel alloc] initWithDic:dic];
                [self.dataSource addObject:model];
            }
            
            // 回调给Controller
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
