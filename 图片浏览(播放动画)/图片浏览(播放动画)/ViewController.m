//
//  ViewController.m
//  图片浏览(播放动画)
//
//  Created by MichaelLi on 16/9/20.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)playAnimation:(UIButton *)sender {
    //创建可变数组
    NSMutableArray *dataM = [NSMutableArray array];
    for (int i = 1; i < 26; i++) {

        //拼接
        NSString  *imageNamed = [NSString stringWithFormat:@"father%03d.png",i];
        UIImage *image = [UIImage imageNamed:imageNamed];
        //添加到可变数组中
        [dataM addObject:image];
    }

    //赋值
    self.imageView.animationImages = dataM;
    //设置播放的时常
    self.imageView.animationDuration = 2;
    //开始播放动画
    [self.imageView startAnimating];

}
- (IBAction)blueMan:(UIButton *)sender {

    NSMutableArray *dataM = [NSMutableArray array];
    for (int i = 1; i < 29; i++) {

        NSString *string = [NSString stringWithFormat:@"greenMan%03d",i];
        UIImage *image = [UIImage imageNamed:string];
        [dataM addObject:image];
    }
    self.imageView.animationImages = dataM;
    self.imageView.animationDuration = 2;
    [self.imageView startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
