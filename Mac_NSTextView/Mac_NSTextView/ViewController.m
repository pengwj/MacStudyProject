//
//  ViewController.m
//  Mac_NSTextView
//
//  Created by pengwenjie on 16/8/16.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "ViewController.h"
#import "ReAttribute.h"

#define msgCell_Width 500

// 利用NSTextView计算带表情文本的高度

@interface ViewController (){
    NSTextView *tempTextView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self sizeWithText:[[NSAttributedString alloc] initWithString:@"123456789123456789😉😉😉😉😉123456789123456[微笑]789😉9"]];
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

- (NSSize)sizeWithText:(NSAttributedString *)tempStr{
    
    ReAttribute *attribut = [[ReAttribute alloc] init];
    //调用检测富文本方法
    NSAttributedString *attributText = [[NSAttributedString alloc] initWithAttributedString:[attribut attributedFontStringWithText:tempStr.string]];
    
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
    [[tempTextView textStorage] insertAttributedString:attributText atIndex: tempTextView.attributedString.length];
//    [[tempTextView textStorage] setFont:[NSFont systemFontOfSize:15]];
    
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
    [self sizeWithText:[[NSAttributedString alloc] initWithString:@"12[微笑]3789😉😉😉😉😉1234456789😉9"]];
}

- (IBAction)thirdBtnDown:(id)sender {
    [tempTextView removeFromSuperview];
    [self sizeWithText:[[NSAttributedString alloc] initWithString:@"12[微笑]3789😉😉😉😉😉1234😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉😉456789😉9"]];
}

- (IBAction)fourBtnDown:(id)sender {
    [tempTextView removeFromSuperview];
    [self sizeWithText:[[NSAttributedString alloc] initWithString:@"1[微笑]23789😉😉237237237237237237237237237😉😉😉12344😉😉😉237237237237237237237237237😉😉237237237237237237237237237😉😉237237237237237237237237237😉😉😉56789😉9"]];
}

- (IBAction)fiveBtnDown:(id)sender {
    [tempTextView removeFromSuperview];
    [self sizeWithText:[[NSAttributedString alloc] initWithString:@"12[微笑]3789😉😉2372372372372😉😉😉😉😉😉😉😉😉😉37237237237237😉😉12344😉😉😉237237237237237😉😉😉😉😉😉😉😉😉😉😉237237237237😉😉2372372372372😉😉😉😉😉😉37237237237237😉😉237237237237237237237237237😉😉😉56789😉9"]];
}

- (void)Calculating_Text_Height_1_Width:(CGFloat)width WithString:(NSAttributedString *)string {
    NSTextStorage *textStorage = [[NSTextStorage alloc] init];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(width, FLT_MAX)];
    [textContainer setLineFragmentPadding:0.0];
    [layoutManager addTextContainer:textContainer];
    [textStorage setAttributedString:string];
    [layoutManager ensureLayoutForTextContainer:textContainer];
    CGRect frame = [layoutManager usedRectForTextContainer:textContainer];
    NSLog(@"1:%@", NSStringFromRect(frame));
    /*
     <a href="\"http://www.v2ex.com/t/149498\"" target="\"_blank\"" onclick="\"return" checkurl(this)\"="" id="\"url_1\"">http://www.v2ex.com/t/149498</a>
     */
}

- (void)Calculating_Text_Height_2_Width:(CGFloat)width WithString:(NSAttributedString *)string {
    CGRect frame = [string boundingRectWithSize:CGSizeMake(width, FLT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) context:nil];
    NSLog(@"2:%@", NSStringFromRect(frame));
    /*
     <a href="\"http://blog.csdn.net/iunion/article/details/12185077\"" target="\"_blank\"" onclick="\"return" checkurl(this)\"="" id="\"url_2\"">http://blog.csdn.net/iunion/article/details/12185077</a>
     */
}

- (void)Calculating_Text_Height_3_Width:(CGFloat)width WithString:(NSAttributedString *)string {
    NSTextStorage *textStorage = [[NSTextStorage alloc] init];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(width, FLT_MAX)];
    [textContainer setLineFragmentPadding:0.0];
    [layoutManager addTextContainer:textContainer];
    [textStorage setAttributedString:string];
    [layoutManager glyphRangeForTextContainer:textContainer];
    CGRect frame = [layoutManager usedRectForTextContainer:textContainer];
    NSLog(@"3:%@", NSStringFromRect(frame));
    /*
     <a href="\"https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/TextLayout/Tasks/StringHeight.html\"" target="\"_blank\"" onclick="\"return" checkurl(this)\"="" id="\"url_3\"">https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/TextLayout/Tasks/StringHeight.html</a>
     <a href="\"http://www.cocoachina.com/b/?p=160\"" target="\"_blank\"" onclick="\"return" checkurl(this)\"="" id="\"url_4\"">http://www.cocoachina.com/b/?p=160</a>
     */
}


@end
