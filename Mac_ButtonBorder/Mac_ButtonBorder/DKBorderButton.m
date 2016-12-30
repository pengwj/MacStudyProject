//
//  DKBorderButton.m
//  Mac_ButtonBorder
//
//  Created by pengwenjie on 2016/12/8.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "DKBorderButton.h"

@interface DKBorderButton ()
{
    NSImageView *imageView;     // 显示的头像等
    
    NSInteger border;
}
@end

@implementation DKBorderButton

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    border = 5;
    imageView = [[NSImageView alloc] initWithFrame:NSMakeRect(border, border, self.frame.size.width-2*border, self.frame.size.height-2*border)];
    [self addSubview:imageView];
    
    // Drawing code here.
}

- (void)awakeFromNib{
    //NSTrackingArea 定义了鼠标在该区域的时候，生成鼠标跟踪和光标更新事件
    NSTrackingArea *trackingArea;
    
    trackingArea = [[NSTrackingArea alloc] initWithRect:[self bounds]
                                                options: (NSTrackingMouseEnteredAndExited | NSTrackingActiveInActiveApp)
                                                  owner:self
                                               userInfo:nil];
    //为当前对象添加一个跟踪者
    [self addTrackingArea:trackingArea];
}
//鼠标动作
- (void)mouseEntered:(NSEvent *)event
{
    //    [super mouseEntered:event];
    if (_isCanchange) {
        normalImage = _originImage;
        
        [self setImage:_originAlternateImage]; //移入状态
        
    }
}

- (void)mouseExited:(NSEvent *)event
{
    //    [super mouseExited:event];
    if (_isCanchange) {
        [self setImage:normalImage];//一般状态
        
    }
}

- (void)mouseDown:(NSEvent *)theEvent
{
    //    [super mouseDown:theEvent];
    if (_isCanchange) {
        [self setImage:_highlightImage]; //点击状态
    }
}

@end
