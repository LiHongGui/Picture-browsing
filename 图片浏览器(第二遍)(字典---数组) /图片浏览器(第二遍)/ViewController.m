//
//  ViewController.m
//  图片浏览器(第二遍)
//
//  Created by MichaelLi on 16/9/19.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleIndex;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//记录点击次数:1 2 3 4
@property(nonatomic,assign) int index;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (weak, nonatomic) IBOutlet UIButton *lastpage;

@property (weak, nonatomic) IBOutlet UIButton *nextPage;

//创建数组
@property(nonatomic,strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    //创建可变字典
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    dict1[@"icon"] = @"father";
    dict1[@"desc"] = @"老爸带着女儿一起踢球,其乐融融";
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    dict2[@"icon"] = @"greenMan";
    dict2[@"desc"] = @"体型跟种族相差挺大的呢";

    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
    dict3[@"icon"] = @"gun";
    dict3[@"desc"] = @"哥们,有枪就牛逼啦";
    NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
    dict4[@"icon"] = @"showLove";
    dict4[@"desc"] = @"秀恩爱,需要注意场合哦";

    //添加到数组中
    self.dataArray = @[dict1,dict2,dict3,dict4];

    self.lastpage.enabled = NO;
    self.index = 1;
    [self changeImage];
}

#pragma mark
#pragma mark -  索引:上一张
- (IBAction)lastPage:(UIButton *)sender {

    self.index --;
    [self changeImage];

}
#pragma mark
#pragma mark -  索引:下一张
- (IBAction)nextPage:(UIButton *)sender {

    self.index ++;
    [self changeImage];



}

-(void)changeImage
{

    //从数组中抽取数据---字典
    NSDictionary *dict = self.dataArray[self.index-1];
    //赋值
    self.titleIndex.text = [NSString stringWithFormat:@"%d/%d",self.index,self.dataArray.count];
    self.imageView.image = [UIImage imageNamed:dict[@"icon"]];
    self.textLabel.text = dict[@"desc"];


    self.lastpage.enabled =(self.index ==1)?NO:YES;
    self.nextPage.enabled =(self.index ==self.dataArray.count)?NO:YES;
}
@end
