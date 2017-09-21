//
//  ViewController.h
//  SortPractice
//
//  Created by Maxdong on 2017/9/20.
//  Copyright © 2017年 Maxdong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *inputTextFiled;
@property (weak, nonatomic) IBOutlet UIButton *continueBtn;
@property (weak, nonatomic) IBOutlet UIButton *bunbleSortBtn;
@property (weak, nonatomic) IBOutlet UILabel *bunbleResultLab;
@property (weak, nonatomic) IBOutlet UIButton *selectSortBtn;
@property (weak, nonatomic) IBOutlet UILabel *selectSortResultLab;
@property (weak, nonatomic) IBOutlet UIButton *insertSortBtn;
@property (weak, nonatomic) IBOutlet UILabel *insertSortResultLab;
@property (weak, nonatomic) IBOutlet UIButton *quickSortBtn;
@property (weak, nonatomic) IBOutlet UILabel *quickSortResultLab;
@property (weak, nonatomic) IBOutlet UILabel *inputRedayNumber;


//冒泡排序
-(NSString *)bunbleSortWithArray:(NSArray *)aData;
//选择排序
-(NSString *)selectSortWithArray:(NSArray *)aData;
//插入排序
-(NSString *)insertSortWithArray:(NSArray *)aData;
//快速排序，对冒泡排序的一种改进
-(NSString *)quickSortWithArray:(NSArray *)aData;
-(void)swapWithData:(NSMutableArray *)aData index1:(NSInteger)index1 index2:(NSInteger)index2;

@end

