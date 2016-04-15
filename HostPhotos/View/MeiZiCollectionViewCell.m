//
//  MeiZiCollectionViewCell.m
//  HostPhotos
//
//  Created by sys on 16/4/15.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "MeiZiCollectionViewCell.h"

#import "HPConfig.h"

#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@implementation MeiZiCollectionViewCell

@synthesize iconUrl = _iconUrl;

-(NSString *)iconUrl {
    return _iconUrl;
}

-(void)setIconUrl:(NSString *)iconUrl {
    _iconUrl = iconUrl;
    [self.iconView setImageWithURL:[NSURL URLWithString:iconUrl] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

@end
