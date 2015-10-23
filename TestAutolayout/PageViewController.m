//
//  PageViewController.m
//  TestAutolayout
//
//  Created by axiBug on 15/10/23.
//  Copyright © 2015年 杭州贝宇网络有限公司. All rights reserved.
//

#import "PageViewController.h"
#import "BranchTableViewController.h"
#import "SecondViewController.h"
#import "ThirdTableViewController.h"

#import "HCollectionViewCell.h"

#import <Masonry.h>

@interface PageViewController ()<UIPageViewControllerDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIPageViewController *pageViewController;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property (nonatomic, strong) BranchTableViewController *firstVC;
@property (nonatomic, strong) SecondViewController *secondVC;
@property (nonatomic, strong) ThirdTableViewController *thirdVC;

@property (nonatomic, strong) NSArray *viewControllers;


@end

@implementation PageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.pageViewController = [[UIPageViewController alloc] init];
    self.pageViewController.dataSource = self;
    
    __weak PageViewController *weakSelf = self;
    self.firstVC.CallBack = ^(CGFloat offSet){
        if (weakSelf.ScrollBlock) {
            weakSelf.ScrollBlock(offSet);
        }
    };
    
    self.secondVC.CallBack = ^(CGFloat offSet){
        if (weakSelf.ScrollBlock) {
            weakSelf.ScrollBlock(offSet);
        }
    };
    
    self.thirdVC.CallBack = ^(CGFloat offSet){
        if (weakSelf.ScrollBlock) {
            weakSelf.ScrollBlock(offSet);
        }
    };
    
    
    self.viewControllers = @[self.firstVC,self.secondVC,self.thirdVC];
    
    [self.pageViewController setViewControllers:@[self.firstVC] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    

    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(@(30));
    }];
    
    [self.pageViewController didMoveToParentViewController:self];
    
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    
    [self.collectionView registerNib:[HCollectionViewCell Nib] forCellWithReuseIdentifier:@"collectionViewCellId"];
    
    
}

#pragma mark - page dateSorce

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return 3;
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self.viewControllers indexOfObject:viewController];
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self.viewControllers objectAtIndex:index];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self.viewControllers indexOfObject:viewController];
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == 3) {
        return nil;
    }
    return [self.viewControllers objectAtIndex:index];
    
}


#pragma mark - collectionViewCell dateSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCellId" forIndexPath:indexPath];
    cell.showLabel.text = @[@"心得",@"产品",@"分类"][indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.collectionView.frame.size.width/3, 30);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (SecondViewController *)secondVC
{
    if(!_secondVC){
        _secondVC = [[SecondViewController alloc] init];
    }
    return _secondVC;
}

- (BranchTableViewController *)firstVC
{
    if (!_firstVC) {
        _firstVC = [[BranchTableViewController alloc] init];
    }
    return _firstVC;
}

- (ThirdTableViewController *)thirdVC
{
    if (!_thirdVC) {
        _thirdVC = [[ThirdTableViewController alloc] init];
    }
    return _thirdVC;
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
