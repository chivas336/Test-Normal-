//
//  HCollectionViewCell.h
//  TestAutolayout
//
//  Created by axiBug on 15/10/23.
//  Copyright © 2015年 杭州贝宇网络有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *showLabel;

+ (UINib *)Nib;

@end
