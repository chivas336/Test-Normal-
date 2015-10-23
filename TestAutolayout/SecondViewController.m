//
//  SecondViewController.m
//  TestAutolayout
//
//  Created by axiBug on 15/10/23.
//  Copyright © 2015年 杭州贝宇网络有限公司. All rights reserved.
//

#import "SecondViewController.h"
#import "HCollectionViewCell.h"

@interface SecondViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[HCollectionViewCell Nib] forCellWithReuseIdentifier:@"BranchCollectionViewCell"];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 40;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BranchCollectionViewCell" forIndexPath:indexPath];
    cell.showLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(collectionView.frame.size.width/2 - 5.f, 150);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.f;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.CallBack) {
        self.CallBack(scrollView.contentOffset.y);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
