//
//  GuideView.m
//  TestAutolayout
//
//  Created by axiBug on 15/10/23.
//  Copyright © 2015年 杭州贝宇网络有限公司. All rights reserved.
//

#import "GuideView.h"

@interface GuideView ()



@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *middleButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end
@implementation GuideView


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (IBAction)clickAction:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    if (self.SelectBlock) {
        self.SelectBlock(button.tag);
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
