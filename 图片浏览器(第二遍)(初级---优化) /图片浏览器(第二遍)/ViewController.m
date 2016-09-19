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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lastpage.enabled = NO;
    self.index = 1;
    [self changeImage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    switch (self.index) {
        case 1:
            self.titleIndex.text = [NSString stringWithFormat:@"%d/3",self.index];
            self.imageView.image = [UIImage imageNamed:@"father001"];
            self.textLabel.text = @"老爸带着女儿一起踢球,其乐融融";
            break;
        case 2:
            self.titleIndex.text = [NSString stringWithFormat:@"%d/3",self.index];
            self.imageView.image = [UIImage imageNamed:@"greenMan001"];
            self.textLabel.text = @"哥俩好";
            break;
        case 3:
            self.titleIndex.text = [NSString stringWithFormat:@"%d/3",self.index];
            self.imageView.image = [UIImage imageNamed:@"gun001"];
            self.textLabel.text = @"哥们,有枪就牛逼啦";
            break;
        default:
            break;
    }

//    if (self.index ==1) {
//        self.lastpage.enabled = NO;
//
//    }
//    if (self.index !=3) {
//        self.nextPage.enabled = YES;
//    }
//
//    if (self.index ==3) {
//        self.nextPage.enabled = NO;
//    }
//
//    if (self.index !=1) {
//        self.lastpage.enabled = YES;
//    }

    self.lastpage.enabled =(self.index ==1)?NO:YES;
    self.nextPage.enabled =(self.index ==3)?NO:YES;
}
@end
