//
//  ViewController.m
//  Mac_ITProgressBar(Demo)
//
//  Created by pengwenjie on 16/9/9.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.progressBar = [[ITProgressBar alloc] initWithFrame:NSMakeRect(100, 100, 200, 6)];
    [self.view addSubview:self.progressBar];
    
    [self.progressBar.animator setPbFloatValue:0.5];
    
    /*
     此处我只是做了一个测试，并没有太多的研究他的用法，更多用法见地址：
     https://github.com/iluuu1994/ITProgressBar
     */
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
