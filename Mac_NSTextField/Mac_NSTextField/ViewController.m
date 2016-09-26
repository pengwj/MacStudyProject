//
//  ViewController.m
//  Mac_NSTextField
//
//  Created by pengwenjie on 16/9/26.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
     事情经过如下，先用storyboard创建了一个NStextField，后用代码创建了一个NStextField
     然后发现storyboard创建的边框为灰色，还蛮漂亮的，而代码创建的是丑陋的黑色，而且根本没办法调整
     最后发现要取消两个属性
     */
    
    NSTextField *textField= [[NSTextField alloc] initWithFrame:NSMakeRect(100, 100, 300, 30)];
    textField.editable = YES;
    textField.placeholderString = @"改变边框颜色";
    [self.view addSubview:textField];
    
    // 改变边框步骤如下
    textField.bordered = YES;
    textField.wantsLayer = YES;
    textField.layer.borderColor = [NSColor redColor].CGColor;
    textField.layer.borderWidth = 1.0f;
    
    // 重要：一定要设置如下属性，否则无法显示效果
    [[textField cell] setBezeled:NO];
    [[textField cell] setBordered:NO];

    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    /*
     
     NSTextField *textField= [[NSTextField alloc] initWithFrame:NSMakeRect(100, 100, 300, 30)];
     textField.editable = YES;
     textField.placeholderString = @"改变边框颜色";
     [self.view addSubview:textField];
     
     // change border color with :
     textField.bordered = YES;
     textField.wantsLayer = YES;
     textField.layer.borderColor = [NSColor redColor].CGColor;
     textField.layer.borderWidth = 1.0f;
     
     // don't forget this code
     [[textField cell] setBezeled:NO];
     [[textField cell] setBordered:NO];
     
     */
    
    // Update the view, if already loaded.
}

@end
