//
//  ViewController.m
//  Mac_NSTextView
//
//  Created by pengwenjie on 16/8/16.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "ViewController.h"
#define msgCell_Width 500

// 利用NSTextView计算带表情文本的高度

@interface ViewController (){
    NSTextView *tempTextView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self sizeWithText:[[NSAttributedString alloc] initWithString:@"123456789123456789😉😉😉😉😉123456789123456789😉9"]];
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

- (NSSize)sizeWithText:(NSAttributedString *)tempStr{
    
    CGFloat maxWidth = 300;
    
    tempTextView = [[NSTextView alloc] initWithFrame:NSMakeRect(100, 200, maxWidth, 0)];
    tempTextView.editable = NO;
    [[tempTextView textStorage] setFont:[NSFont systemFontOfSize:15]];
    tempTextView.backgroundColor = [NSColor redColor];
    tempTextView.string = @"";
    [tempTextView setHorizontallyResizable:NO];
    [tempTextView setVerticallyResizable:YES];
    [tempTextView setAutoresizingMask:NSViewHeightSizable];
    [[tempTextView textContainer]setWidthTracksTextView:NO];
    [[tempTextView textContainer]setHeightTracksTextView:YES];

    //    NSSize tempSize = NSMakeSize(maxWidth, height);
    tempTextView.maxSize = NSMakeSize(maxWidth, MAXFLOAT);
    tempTextView.minSize = NSMakeSize(maxWidth, 0);
    [[tempTextView textContainer]setContainerSize:NSMakeSize(maxWidth, 0)];
    //    // textContainer
    [[tempTextView textStorage] insertAttributedString:tempStr atIndex: tempTextView.attributedString.length];
    [[tempTextView textStorage] setFont:[NSFont systemFontOfSize:15]];
    
    // addSubview要放在赋值后
    [self.view addSubview:tempTextView];

    NSLog(@"textStorage:%@",NSStringFromSize([[tempTextView textStorage] size]));
    NSLog(@"tempTextView:%@",NSStringFromSize(tempTextView.frame.size));
    NSLog(@"NSTextContainer:%@",NSStringFromSize(tempTextView.textContainer.size));
    NSLog(@"accessibilityFrame:%@",NSStringFromSize(tempTextView.accessibilityFrame.size));
    NSLog(@"NSTextContainer:%@",NSStringFromSize(tempTextView.textContainerInset));
    NSLog(@"size:%@",NSStringFromSize(tempTextView.textContainer.textView.frame.size));
    
    return tempTextView.frame.size;
}

- (IBAction)firstBtnDown:(id)sender {
    
    [tempTextView removeFromSuperview];
    [self sizeWithText:[[NSAttributedString alloc] initWithString:@"123789😉😉😉😉😉1234456789😉9"]];

}

- (IBAction)secondBtnDown:(id)sender {
    [tempTextView removeFromSuperview];
    [self sizeWithText:[[NSAttributedString alloc] initWithString:@"123372372372372372372378372372372372372372371"]];
}

- (IBAction)thirdBtnDown:(id)sender {
    [tempTextView removeFromSuperview];
    [self sizeWithText:[[NSAttributedString alloc] initWithString:@"123789😉😉😉😉😉1234😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉456789😉9"]];
}

- (IBAction)fourBtnDown:(id)sender {
    [tempTextView removeFromSuperview];
    [self sizeWithText:[[NSAttributedString alloc] initWithString:@"123789😉😉237237237237237237237237237😉😉😉12344😉😉😉237237237237237237237237237😉😉237237237237237237237237237😉😉237237237237237237237237237😉😉😉56789😉9"]];
}

- (IBAction)fiveBtnDown:(id)sender {
    [tempTextView removeFromSuperview];
    [self sizeWithText:[[NSAttributedString alloc] initWithString:@"123789😉😉2372372372372😉😉😉😉😉😉😉😉😉😉37237237237237😉😉12344😉😉😉237237237237237😉😉😉😉😉😉😉😉😉😉😉237237237237😉😉2372372372372😉😉😉😉😉😉37237237237237😉😉237237237237237237237237237😉😉😉56789😉9"]];
}

@end
