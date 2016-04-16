//
//  HPViewController.m
//  HostPhotos
//
//  Created by sys on 16/4/16.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "HPViewController.h"

@interface HPViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation HPViewController

static NSString * const reuseIdentifier = @"MeiZiCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initComponent];
    
}

#pragma mark - Init
- (void)initComponent {
    
    self.lim = 20;
    self.off = 0;
    
    self.meiziArray = [[NSMutableArray alloc] init];
    
    HPFlowLayout *collectLayout = [[HPFlowLayout alloc] init];
    self.contentCollectView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:collectLayout];
    
    self.contentCollectView.delegate = self;
    self.contentCollectView.dataSource = self;
    self.contentCollectView.showsVerticalScrollIndicator = true;
    self.contentCollectView.pagingEnabled = true;
    
    [self.contentCollectView registerNib:[UINib nibWithNibName:@"MeiZiCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    [self.view addSubview:self.contentCollectView];
    
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