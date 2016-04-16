//
//  HPViewModel.h
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HostPhotosRequest.h"

typedef void (^HPViewModelSuccessBack)(NSArray *datasource);
typedef void (^HPVieModelErrorCallBack)(NSError *error);

@interface HPViewModel : NSObject

@property (nonatomic, assign) MeiziType type;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, assign) BOOL needAutoRefresh;
@property (nonatomic, strong) NSDate *lastRefreshTime;
@property (nonatomic, copy) NSString *kLastRefreshTime;
@property (nonatomic, strong) NSUserDefaults *userDefaults;

@property (nonatomic, copy) HPViewModelSuccessBack successCallBack ;
@property (nonatomic, copy) HPVieModelErrorCallBack errorCallBack   ;

- (void)getData:(NSInteger)off withLim:(NSInteger)lim withSuccessBack:(HPViewModelSuccessBack )successCallBack withErrorCallBack:(HPVieModelErrorCallBack )errorCallBack;

- (instancetype)initWithType:(MeiziType)type withCollectionView:(UICollectionView *)collectionView;

@end
