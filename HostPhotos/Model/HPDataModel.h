//
//  HPDataModel.h
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPDataModel : NSObject

@property (nonatomic, strong) NSArray *pub_time;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *startcount;
@property (nonatomic, strong) NSString *imgsrc;
@property (nonatomic, strong) NSString *toplink;
@property (nonatomic, assign) NSString *photo_id;

-(instancetype)initWithDic :(NSDictionary *)dic;

@end
