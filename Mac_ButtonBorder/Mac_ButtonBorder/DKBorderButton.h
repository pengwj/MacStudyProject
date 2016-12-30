//
//  DKBorderButton.h
//  Mac_ButtonBorder
//
//  Created by pengwenjie on 2016/12/8.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DKBorderButton : NSImageView
{
    NSImage* normalImage;
    NSImage* alternateImage;
}
@property (nonatomic,assign) BOOL isCanchange;
@property (nullable, strong) NSImage *originImage;          //一般状态
@property (nullable, strong) NSImage *originAlternateImage; //移入状态
@property (nullable, strong) NSImage *highlightImage;      //点击状态

@property (nonnull, strong) NSImage *headImage;

@end
