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
-(void)imageAnimationString:(NSString *)string andWithNumber:(int)number
{
    //创建可变数组
    NSMutableArray *dataM = [NSMutableArray array];
    //判断:动画在播时,点击按钮不反应
    if ([self.imageView isAnimating ])
        return;
    for (int i = 1; i < number+1; i++) {
        //拼接
        NSString *imageNamed = [NSString stringWithFormat:@"%@%03d.png",string,i];
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *string = [bundle pathForResource:imageNamed ofType:nil];
        #warning 加载图片
        /*
         1.UIImage *image = [UIImage imageNamed
         图片放在Assets.xcassets中,先加载图片到内存,然后再从内存中读取图片(加载快,但占用内存)
         2.UIImage *image = [UIImage imageWithContentsOfFile:string];图片放在外面,加载图片是加载图片的路径(非缓存),完毕后,可以释放内存,适合图片较多时使用
         */
        //加载图片
        UIImage *image = [UIImage imageWithContentsOfFile:string];
    
        //添加到数组中
        [dataM addObject:image];
    }
    //赋值
    self.imageView.animationImages = dataM;
    //动画持续时间
    self.imageView.animationDuration = number*0.1;
    NSLog(@"animationDuration:%f",self.imageView.animationDuration);
    self.imageView.animationRepeatCount = 1;
    //开始动画
    [self.imageView startAnimating];

    //当图片比方完毕,释放内存
    [self performSelector:@selector(cleanImage) withObject:nil afterDelay:self.imageView.animationDuration];
}

-(void) cleanImage
{
    self.imageView.animationImages = nil;

}
- (IBAction)playAnimation:(UIButton *)sender {
//   [self imageAnimationString:@"father" andWithNumber:25];
    [self imageAnimationString:@"father" andWithNumber:25];
}
- (IBAction)blueMan:(UIButton *)sender {

    [self imageAnimationString:@"greenMan" andWithNumber:28];
}




@end
