//
//  ViewController.m
//  Mac_NSTextView(NSScrollView)
//
//  Created by pengwenjie on 16/8/12.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

/*
    手写:NSTextView
    相关文章:http://blog.csdn.net/kanghua68/article/details/6157908
 */

- (void)viewDidLoad {
    [super viewDidLoad];

    NSScrollView *scrollView = [[NSScrollView alloc]initWithFrame:CGRectMake(0, 35, 335, 190)];
    [scrollView setBorderType:NSNoBorder];
    [scrollView setHasVerticalScroller:YES];
    [scrollView setHasHorizontalScroller:NO];
    [scrollView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    _txtView =     [[NSTextView alloc]initWithFrame:CGRectMake(0, 0, 335, 190)];
    [_txtView setMinSize:NSMakeSize(0.0, 190)];
    [_txtView setMaxSize:NSMakeSize(FLT_MAX, FLT_MAX)];
    [_txtView setVerticallyResizable:YES];
    [_txtView setHorizontallyResizable:NO];
    [_txtView setAutoresizingMask:NSViewWidthSizable];
    [[_txtView textContainer]setContainerSize:NSMakeSize(335,FLT_MAX)];
    [[_txtView textContainer]setWidthTracksTextView:YES];
    [_txtView setFont:[NSFont fontWithName:@"Helvetica" size:12.0]];
    [_txtView setEditable:NO];
    [scrollView setDocumentView:_txtView];
    
    _txtView.string = @"原始数据";
    [self.view addSubview:scrollView];
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)configTextStrButton:(id)sender {
    _txtView.string = @"重新设置数据";
}

@end
