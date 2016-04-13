//
//  HPAllCollectionViewController.m
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "HPAllCollectionViewController.h"

#import "MeiziCell.h"
#import "HPConfig.h"
#import "HPViewModel.h"
#import "HPDataModel.h"
#import "HostPhotosRequest.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@interface HPAllCollectionViewController ()

@property (nonatomic, strong) NSMutableArray *meiziArray;
@property (nonatomic, strong) HPViewModel *viewModel;
@property (nonatomic, assign) NSInteger off;
@property (nonatomic, assign) NSInteger lim;

@end

@implementation HPAllCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[MeiziCell class] forCellWithReuseIdentifier:@"MeiziCell"];
    
    [self initComponent];
    
    [self.viewModel getData:_off withLim:_lim withSuccessBack:^(NSArray *datasource) {
        
    } withErrorCallBack:^(NSError *error) {
        
    }];
}

#pragma mark - Init
- (void)initComponent {
    self.viewModel = [[HPViewModel alloc] initWithType:MeiziTypeAll];
    self.lim = 20;
    self.off = 0;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.meiziArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MeiziCell *cell     = [collectionView dequeueReusableCellWithReuseIdentifier:@"MeiziCell" forIndexPath:indexPath];
    HPDataModel *meizi  = [[HPDataModel alloc] initWithDic:[self.meiziArray objectAtIndex:indexPath.row]];
    NSURL *imageURL     = [NSURL URLWithString:meizi.imgsrc];
    [cell.imageview setImageWithURL:imageURL usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH/3-1, SCREEN_WIDTH/3-1);
}


#pragma mark <UICollectionViewDelegate>

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"shouldSelectItemAtIndex...");
    
    return YES;
}

@end
