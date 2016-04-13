//
//  HostPhotosRequest.m
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "HostPhotosRequest.h"

@interface HostPhotosRequest()

@property (nonatomic, assign) NSInteger lim;
@property (nonatomic, assign) MeiziType cid;
@property (nonatomic, assign) NSInteger off;

@end

@implementation HostPhotosRequest

-(instancetype)initWithOff:(NSInteger)off meiziLimit:(NSInteger)lim meiziCid:(MeiziType)cid {
    self = [super init];
    if (self) {
        _lim    = lim;
        _cid    = cid;
        _off    = off;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/meizi/";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

- (id)requestArgument {
    return @{@"cid": @(_cid),
             @"limit": @(_lim),
             @"offset": @(_off)};
}

@end