//
//  HostPhotosRequest.h
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import <YTKNetwork/YTKRequest.h>

typedef NS_ENUM(NSUInteger, MeiziType) {
    MeiziTypeAll     = 1,
    MeiziTypeDaXiong = 2,
    MeiziTypeQiaoTun = 6,
    MeiziTypeHeisi   = 7,
    MeiziTypeMeiTui  = 3,
    MeiziTypeQingXin = 4,
    MeiziTypeZaHui   = 5
};

@interface HostPhotosRequest : YTKRequest

- (instancetype)initWithOff:(NSInteger)off meiziLimit:(NSInteger)lim meiziCid:(MeiziType)cid;

@end
