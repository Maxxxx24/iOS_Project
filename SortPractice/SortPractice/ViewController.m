//
//  ViewController.m
//  SortPractice
//
//  Created by Maxdong on 2017/9/20.
//  Copyright © 2017年 Maxdong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@property (strong, nonatomic)NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.inputTextFiled.delegate = self;
    self.dataArray = [[NSMutableArray alloc] init];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

/*-----------------insertSort-----------------*/
/*
 1.思想：
 一般来说，插入排序都采用in-place在数组上实现。具体算法描述如下：
 从第一个元素开始，该元素可以认为已经被排序
 取出下一个元素，在已经排序的元素序列中从后向前扫描
 如果该元素（已排序）大于新元素，将该元素移到下一位置
 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置
 将新元素插入到该位置后
 重复步骤2~5
 如果比较操作的代价比交换操作大的话，可以采用二分查找法来减少比较操作的数目。该算法可以认为是插入排序的一个变种，称为二分查找插入排
 
 2.时间复杂度:
 最好的情况下：正序有序(从小到大)，这样只需要比较n次，不需要移动。因此时间复杂度为O(n)
 最坏的情况下：逆序有序,这样每一个元素就需要比较n次，共有n个元素，因此实际复杂度为O(n­2)
 平均情况下：O(n­2)
 
 3.稳定性：
 理解性记忆比死记硬背要好。因此，我们来分析下。稳定性，就是有两个相同的元素，排序先后的相对位置是否变化，主要用在排序时有多个排序规则的情况下。在插入排序中，K1是已排序部分中的元素，当K2和K1比较时，直接插到K1的后面(没有必要插到K1的前面，这样做还需要移动！！)，因此，插入排序是稳定的。
 */

-(NSString *)insertSortWithArray:(NSArray *)aData {
    NSMutableArray *data = [[NSMutableArray alloc]initWithArray:aData];
    
    for (int i = 1; i < [data count]; i++) {
        id tmp = [data objectAtIndex:i];
        int j = i - 1;
        while (j != -1 && [data objectAtIndex:j] > tmp) {
            [data replaceObjectAtIndex:j+1 withObject:[data objectAtIndex:j]];
            j--;
        }
        [data replaceObjectAtIndex:j+1 withObject:tmp];
    }
    NSLog(@"插入排序后的结果是：%@",[data description]);
    NSString *result = [data componentsJoinedByString:@" "];
    return result;
}

/*-----------------bunbleSort-----------------*/
/*
 1.思想：
 通过无序区中相邻记录关键字间的比较和位置的交换,使关键字最小的记录如气泡一般逐渐往上“漂浮”直至“水面”。
 1）比较相邻的元素。如果第一个比第二个大，就交换他们两个。
 2）对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。
 3）针对所有的元素重复以上的步骤，除了最后一个。
 4）持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。
 最坏时间复杂度	 O(n^{2})
 最优时间复杂度	 O(n)
 平均时间复杂度	 O(n^{2})
 空间复杂度	总共  O(n)，需要辅助空间  O(1)
 
 2.时间复杂度：
 最好情况下：正序有序，则只需要比较n次。故，为O(n)
 最坏情况下: 逆序有序，则需要比较(n-1)+(n-2)+……+1，故，为O(N*N)
 
 3.稳定性：
 排序过程中只交换相邻两个元素的位置。因此，当两个数相等时，是没必要交换两个数的位置的。所以，它们的相对位置并没有改变，冒泡排序算法是稳定的！
 */
-(NSString *)bunbleSortWithArray:(NSArray *)aData {
    NSMutableArray *data = [[NSMutableArray alloc]initWithArray:aData];
    for (int i=0; i<[data count]-1; i++) {
        for (int j =0; j<[data count]-1-i; j++) {
            if ([data objectAtIndex:j] > [data objectAtIndex:j+1]) {
                [self swapWithData:data index1:j index2:j+1];
            }
        }
    }
    
    NSLog(@"冒泡排序后的结果：%@",[data description]);
    NSString *result = [data componentsJoinedByString:@" "];
    return result;
}

/*-----------------selectSort-----------------*/
/*
 1.思想：
 首先在未排序序列中找到最小元素，存放到排序序列的起始位置，然后，再从剩余未排序元素中继续寻找最小元素，然后放到排序序列末尾。以此类推，直到所有元素均排序完毕。具体做法是：选择最小的元素与未排序部分的首部交换，使得序列的前面为有序。
 
 2.时间复杂度。
 最好情况下：交换0次，但是每次都要找到最小的元素，因此大约必须遍历N*N次，因此为O(N*N)。减少了交换次数！
 最坏情况下，平均情况下：O(N*N)
 
 最坏时间复杂度	О(n²)
 最优时间复杂度	О(n²)
 平均时间复杂度	О(n²)
 空间复杂度	О(n) total, O(1) auxiliary
 
 3.稳定性：
 由于每次都是选取未排序序列A中的最小元素x与A中的第一个元素交换，因此跨距离了，很可能破坏了元素间的相对位置，因此选择排序是不稳定的！
 
 */
-(NSString *)selectSortWithArray:(NSArray *)aData {
    NSMutableArray *data = [[NSMutableArray alloc] initWithArray:aData];
    
    for (int i = 0; i < [data count] - 1; i++) {
        int min = i;
        for (int j = i + 1; j < [data count]; j++) {
            if ([data objectAtIndex:j] < [data objectAtIndex:min]) {
                [data exchangeObjectAtIndex:j withObjectAtIndex:min];
            }
        }
    }
    NSLog(@"选择排序后的结果：%@",[data description]);
    
    NSString *result = [data componentsJoinedByString:@" "];
    return result;
}


/*-----------------quickSort-----------------*/
/*
 1.思想：
 它是由冒泡排序改进而来的。在待排序的n个记录中任取一个记录(通常取第一个记录),把该记录放入适当位置后,数据序列被此记录划分成两部分。所有关键字比该记录关键字小的记录放置在前一部分,所有比它大的记录放置在后一部分,并把该记录排在这两部分的中间(称为该记录归位),这个过程称作一趟快速排序。
 
 2.时间复杂度：
 最好的情况下：因为每次都将序列分为两个部分(一般二分都复杂度都和logN相关)，故为 O(N*logN)
 最坏的情况下：基本有序时，退化为冒泡排序，几乎要比较N*N次，故为O(N*N)
 
 3.稳定性：
 由于每次都需要和中轴元素交换，因此原来的顺序就可能被打乱。如序列为 5 3 3 4 3 8 9 10 11会将3的顺序打乱。所以说，快速排序是不稳定的！
 */
-(NSString *)quickSortWithArray:(NSArray *)aData{
    NSMutableArray *data = [[NSMutableArray alloc] initWithArray:aData];
    [self quickSortWithArray:data left:0 right:[aData count]-1];
    NSLog(@"快速排序后的结果：%@",[data description]);
     NSString *result = [data componentsJoinedByString:@" "];
    return result;
    
}

-(void)quickSortWithArray:(NSMutableArray *)aData left:(NSInteger)left right:(NSInteger)right{
    if (right > left) {
        NSInteger i = left;
        NSInteger j = right + 1;
        while (true) {
            while (i + 1 < [aData count] && [aData objectAtIndex:++i] < [aData objectAtIndex:left]) ;
            while (j - 1 > -1 && [aData objectAtIndex:--j] > [aData objectAtIndex:left]) ;
            if (i >= j) {
                break;
            }
            [self swapWithData:aData index1:i index2:j];
        }
        [self swapWithData:aData index1:left index2:j];
        [self quickSortWithArray:aData left:left right:j-1];
        [self quickSortWithArray:aData left:j+1 right:right];
    }
}

-(void)swapWithData:(NSMutableArray *)aData index1:(NSInteger)index1 index2:(NSInteger)index2 {
    NSNumber *tmp = [aData objectAtIndex:index1];
    [aData replaceObjectAtIndex:index1 withObject:[aData objectAtIndex:index2]];
    [aData replaceObjectAtIndex:index2 withObject:tmp];
    
}

#pragma mark - Button Action -

- (IBAction)continueAction:(id)sender {
    
    [self.dataArray addObject:self.inputTextFiled.text];
    self.inputTextFiled.text = @"";
    self.inputRedayNumber.text = [self.dataArray componentsJoinedByString:@" "];
}
- (IBAction)bunbleSortAction:(id)sender {
    if (self.dataArray == NULL) {
        return;
    }
    
    self.bunbleResultLab.text = [self bunbleSortWithArray:self.dataArray];
    
}
- (IBAction)selectSortAction:(id)sender {
    if (self.dataArray == NULL) {
        return;
    }
    self.selectSortResultLab.text = [self selectSortWithArray:self.dataArray];
}

- (IBAction)insertSortAction:(UIButton *)sender {
    if (self.dataArray == NULL) {
        return;
    }
    
    self.insertSortResultLab.text = [self insertSortWithArray:self.dataArray];
}

- (IBAction)quickSortActionB:(id)sender {
    if (self.dataArray == NULL) {
        return;
    }
    
    self.quickSortResultLab.text = [self quickSortWithArray:self.dataArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
