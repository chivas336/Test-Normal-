//
//  ScrollViewController.m
//  TestAutolayout
//
//  Created by axiBug on 15/10/22.
//  Copyright © 2015年 杭州贝宇网络有限公司. All rights reserved.
//

#import "ScrollViewController.h"
#import "PageViewController.h"

#import <Masonry.h>


static const CGFloat heightOfConstraint = 100.f;

@interface ScrollViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UIView *mainView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightOfConstraint;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    PageViewController *pageViewController = [[PageViewController alloc] init];
    pageViewController.ScrollBlock = ^(CGFloat offSet){
        
        if (offSet> 0 && offSet < heightOfConstraint) {
             self.heightOfConstraint.constant = heightOfConstraint - offSet;
        }else if(offSet < 0){
            self.heightOfConstraint.constant = heightOfConstraint;
        }else if (offSet > heightOfConstraint){
            self.heightOfConstraint.constant = 0.f;
        }
       
    };
    [self addChildViewController:pageViewController];
    [self.mainView addSubview:pageViewController.view];
    [pageViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.mainView);
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
