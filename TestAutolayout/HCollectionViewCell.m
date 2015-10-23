//
//  HCollectionViewCell.m
//  TestAutolayout
//
//  Created by axiBug on 15/10/23.
//  Copyright © 2015年 杭州贝宇网络有限公司. All rights reserved.
//

#import "HCollectionViewCell.h"

@implementation HCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}


+ (UINib *)Nib

{
    return [UINib nibWithNibName:@"HCollectionViewCell" bundle:nil];
}

@end
