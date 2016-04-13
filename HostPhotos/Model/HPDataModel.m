//
//  HPDataModel.m
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "HPDataModel.h"

@implementation HPDataModel

-(instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.photo_id   = [dic objectForKey:@"id"];
        self.pub_time   = [dic objectForKey:@"pub_time"];
        self.title      = [dic objectForKey:@"title"];
        self.startcount = [dic objectForKey:@"startcount"];
        self.imgsrc     = [dic objectForKey:@"imgsrc"];
        self.toplink    = [dic objectForKey:@"toplink"];
    }
    return self;
}

@end
