//
//  ViewController.m
//  Mac_NSScrollView
//
//  Created by pengwenjie on 16/8/31.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addScrollViewByCode];
    
    [self addButtonDown];
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)addScrollViewByCode
{
    // 1、实例化NSScrollView
    self.scrollView = [[NSScrollView alloc] initWithFrame:NSMakeRect(0, 0, 480, 270)];
    [self.view addSubview:self.scrollView];
    self.scrollView.hasHorizontalScroller = YES;

    // 2、给NSScrollView设置documentView（很重要的一步）
    NSView *docView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 480*9, 270)];
    self.scrollView.documentView = docView;
    self.scrollView.backgroundColor = [NSColor yellowColor];
    
    // 3、将布局添加到documentView上面
    for (int i=0; i<9; i++) {
        NSImageView *imageView = [[NSImageView alloc] initWithFrame:NSMakeRect(480*i, 0, 480, 270)];
        imageView.image = [NSImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        [docView addSubview:imageView];
    }
    
}

- (void)addButtonDown{
    NSButton *leftBtn = [[NSButton alloc] initWithFrame:NSMakeRect(10, 120, 40, 40)];
    [leftBtn setImage:[NSImage imageNamed:@"Left Filled-50"]];
    [leftBtn setTarget:self];
    leftBtn.bordered = NO;
    [leftBtn setAction:@selector(leftBtnDown:)];
    [self.scrollView addSubview:leftBtn];

    NSButton *rightBtn = [[NSButton alloc] initWithFrame:NSMakeRect(430, 120, 40, 40)];
    [rightBtn setImage:[NSImage imageNamed:@"Right Filled-50"]];
    [rightBtn setTarget:self];
    rightBtn.bordered = NO;
    [rightBtn setAction:@selector(rightBtnDown:)];
    [self.scrollView addSubview:rightBtn];
}

- (void)leftBtnDown:(NSButton *)leftBtn
{
    [self getXToLeft];    
}

- (void)getXToLeft{
    CGFloat orgin_X = self.scrollView.documentVisibleRect.origin.x;
    CGFloat new_X = orgin_X - self.scrollView.contentSize.width;
    if (new_X>=0) {
        [self.scrollView.contentView scrollPoint:NSMakePoint(new_X, 0)];
    } else {
        [self.scrollView.contentView scrollPoint:NSMakePoint(self.scrollView.contentSize.width*8, 0)];
    }
}

- (void)rightBtnDown:(NSButton *)rightBtn
{
    [self getXToRight];
}

- (void)getXToRight{
    CGFloat orgin_X = self.scrollView.documentVisibleRect.origin.x;
    CGFloat new_X = orgin_X + self.scrollView.contentSize.width;
    if (new_X<=self.scrollView.contentSize.width*8) {
        [self.scrollView.contentView scrollPoint:NSMakePoint(new_X, 0)];
    } else {
        [self.scrollView.contentView scrollPoint:NSMakePoint(0, 0)];
    }
}

@end
