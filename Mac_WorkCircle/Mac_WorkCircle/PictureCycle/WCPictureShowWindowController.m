//
//  WCPictureShowWindowController.m
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/31.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "WCPictureShowWindowController.h"

NSInteger const PS_Height = 600;
NSInteger const PS_Width = 430;
NSInteger const PS_Margin = 0;

@interface WCPictureShowWindowController ()
@property (nonatomic, strong) NSScrollView *backScrollView;
@property (nonatomic, strong) NSView *docView;
@property (nonatomic, assign) NSInteger imageCount;

@end

@implementation WCPictureShowWindowController

static  WCPictureShowWindowController *singleton;
+ (WCPictureShowWindowController *)sharedInstancePictures:(NSArray *)array index:(NSUInteger)index
{
    static dispatch_once_t token;
    dispatch_once(&token,^{
        
        singleton = [[WCPictureShowWindowController alloc] initWithWindowNibName:@"WCPictureShowWindowController"];
        [singleton makeUI];
    });
    
    [singleton showPictures:array index:index];
    
    return singleton;
}


- (void)setWindowUI {
    
    self.window.title = @"图片";
    NSButton *minimizeBtn = [self.window standardWindowButton:NSWindowMiniaturizeButton];
    minimizeBtn.hidden = YES;
    NSButton *zoomBtn = [self.window standardWindowButton:NSWindowZoomButton];
    zoomBtn.hidden = YES;
    
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    [self setWindowUI];
    [self makeUI];

    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (void)makeUI
{
    // 1、实例化NSScrollView
    self.backScrollView = [[NSScrollView alloc] initWithFrame:NSMakeRect(PS_Margin, PS_Margin, PS_Width, PS_Height)];
    [self.window.contentView addSubview:self.backScrollView];
    
    // 2、给NSScrollView设置documentView（很重要的一步）
    self.docView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, PS_Width, PS_Height)];
    self.backScrollView.documentView = self.docView;
    
    NSButton *leftBtn = [[NSButton alloc] initWithFrame:NSMakeRect(0, PS_Height/2, 40, 40)];
    [leftBtn setImage:[NSImage imageNamed:@"Left Filled-50"]];
    [leftBtn setTarget:self];
    leftBtn.bordered = NO;
    [leftBtn setAction:@selector(leftBtnDown:)];
    [self.backScrollView addSubview:leftBtn];
    
    NSButton *rightBtn = [[NSButton alloc] initWithFrame:NSMakeRect(PS_Width-60, PS_Height/2, 40, 40)];
    [rightBtn setImage:[NSImage imageNamed:@"Right Filled-50"]];
    [rightBtn setTarget:self];
    rightBtn.bordered = NO;
    [rightBtn setAction:@selector(rightBtnDown:)];
    [self.backScrollView addSubview:rightBtn];
}

- (void)leftBtnDown:(NSButton *)leftBtn
{
    [self getXToLeft];
}

- (void)getXToLeft{
    CGFloat orgin_X = self.backScrollView.documentVisibleRect.origin.x;
    CGFloat new_X = orgin_X - self.backScrollView.contentSize.width;
    if (new_X>=0) {
        [self.backScrollView.contentView scrollPoint:NSMakePoint(new_X, 0)];
    } else {
        [self.backScrollView.contentView scrollPoint:NSMakePoint(self.backScrollView.contentSize.width*(_imageCount-1), 0)];
    }
}

- (void)rightBtnDown:(NSButton *)rightBtn
{
    [self getXToRight];
}

- (void)getXToRight{
    CGFloat orgin_X = self.backScrollView.documentVisibleRect.origin.x;
    CGFloat new_X = orgin_X + self.backScrollView.contentSize.width;
    if (new_X<=self.backScrollView.contentSize.width*(_imageCount-1)) {
        [self.backScrollView.contentView scrollPoint:NSMakePoint(new_X, 0)];
    } else {
        [self.backScrollView.contentView scrollPoint:NSMakePoint(0, 0)];
    }
}

- (void)showPictures:(NSArray *)array index:(NSUInteger)index
{
    _imageCount = array.count;
    
    self.docView.frame = NSMakeRect(0, 0, PS_Width*array.count, PS_Height);
    
    // 3、将布局添加到documentView上面
    for (int i=0; i<array.count; i++) {
        NSImageView *imageView = [[NSImageView alloc] initWithFrame:NSMakeRect(PS_Width*i, 0, PS_Width, PS_Height)];
        imageView.imageScaling = NSImageScaleProportionallyUpOrDown;
        imageView.image = array[i];
        [self.docView addSubview:imageView];
    }
    
    [self.backScrollView.contentView scrollPoint:NSMakePoint(PS_Width*index, 0)];
}


@end
