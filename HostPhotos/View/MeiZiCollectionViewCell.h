//
//  MeiZiCollectionViewCell.h
//  HostPhotos
//
//  Created by sys on 16/4/15.
//  Copyright © 2016年 sys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeiZiCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (strong, nonatomic) NSString *iconUrl;

@end
