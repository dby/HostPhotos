//
//  HPFlowLayout.m
//  HostPhotos
//
//  Created by sys on 16/4/13.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "HPFlowLayout.h"
#import "HPConfig.h"

@implementation HPFlowLayout

-(void)prepareLayout {
    
    [super prepareLayout];
    self.itemSize           = CGSizeMake(SCREEN_WIDTH/8-2, 60);
    self.scrollDirection    = UICollectionViewScrollDirectionHorizontal;
    self.sectionInset       = UIEdgeInsetsMake(0, 2, 0, 2);
    self.minimumLineSpacing = 2;
}

@end
