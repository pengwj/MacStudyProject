//
//  TapedImageView.h
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/30.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSView+AutoCategory.h"

typedef void(^tapedImageBlock)(NSUInteger index);
typedef void(^longTouchImageBlock)(NSUInteger index);

@interface TapedImageView : NSImageView <NSGestureRecognizerDelegate>

@property (nonatomic, copy) tapedImageBlock tapedBlock;
@property (nonatomic, copy) longTouchImageBlock longTouchBlock;

@end
