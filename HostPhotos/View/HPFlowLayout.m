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
    
    self.itemSize           = CGSizeMake(SCREEN_WIDTH/3 - 2, SCREEN_WIDTH/2.5 - 1);
    self.scrollDirection    = UICollectionViewScrollDirectionVertical;
    self.minimumLineSpacing = 2;
    self.minimumInteritemSpacing = 2;
}

@end
