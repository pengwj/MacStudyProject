//
//  TapedImageView.m
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/30.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "TapedImageView.h"

@implementation TapedImageView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSClickGestureRecognizer *click = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(taped)];
        click.numberOfClicksRequired = 1;
        [self addGestureRecognizer:click];
    }
    return self;
}
- (void)longTouched
{
    if(self.longTouchBlock){
        self.longTouchBlock(self.tag);
    }
}
- (void)taped
{
    if (self.tapedBlock) {
        self.tapedBlock(self.tag);
    }
}

@end
