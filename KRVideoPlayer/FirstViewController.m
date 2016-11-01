//
//  FirstViewController.m
//  KRVideoPlayer
//
//  Created by aidenluo on 5/23/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//

#import "FirstViewController.h"
#import "KRVideoPlayerController.h"

@interface FirstViewController ()

@property (nonatomic, strong) KRVideoPlayerController *videoController;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playLocalVideo:(id)sender
{
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"150511_JiveBike" withExtension:@"mov"];
    [self playVideoWithURL:videoURL];
}

- (IBAction)playRemoteVideo:(id)sender
{
    [self playVideoWithURL:nil];
}

- (void)playVideoWithURL:(NSURL *)url
{
    if (!self.videoController) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.videoController = [[KRVideoPlayerController alloc] initWithFrame:CGRectMake(0, 0, width, width*(9.0/16.0))];
        __weak typeof(self)weakSelf = self;
        
        [self.videoController setKRVideoPlayBlock:^(KRVideoPlayType type,NSInteger index){
            
            if(type == KRVideoPlayClose){
                weakSelf.videoController = nil;
                NSLog(@"关闭视频播放器");
                
            }else if(type == KRVideoPlayNext){
                
                NSLog(@"播放视频index＝%ld",(long)index);
            }
            
        }];
        [self.videoController showInWindow];
    }
    
    if(url){
        //播放单个视频
        self.videoController.contentURL = url;
        return;
    }
    
    //播放多个视频
    NSArray * urls = @[@"https://mvvideo5.meitudata.com/57ea0c22ec7da2114.mp4",@"https://mvvideo5.meitudata.com/57ef1d932ef465184.mp4",@"https://mvvideo5.meitudata.com/578da9761930e4509.mp4",@"https://mvvideo5.meitudata.com/57ee0c932c8c09697.mp4"];
    [self.videoController setURLArray:urls];
}

@end
