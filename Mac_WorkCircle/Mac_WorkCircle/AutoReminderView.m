//
//  AutoReminderView.m
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/29.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "AutoReminderView.h"

@implementation AutoReminderView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
//    self.showAddButton = NO;
    
    // Drawing code here.
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.showAddButton = NO;
    }
    return self;
}
- (void)setImages:(NSMutableArray *)images
{
    if (_images.count > 0) {
        [_images removeAllObjects];
    }
    if (_images == nil ) {
        _images = [NSMutableArray arrayWithCapacity:self.limitImages];
    }
    [_images removeAllObjects];
    if (images.count > self.limitImages) {
        _images = [NSMutableArray arrayWithArray:[images subarrayWithRange:NSMakeRange(0, self.limitImages)]];
        
    }else{
        _images = images;
    }
    [self layout];
}
- (void)layout
{
    for (NSView *temp in self.subviews) {
        [temp removeFromSuperview];
    }
    
    for (int i = 0 ; i < _images.count; i++)
    {
        int line = i/self.numberOfLine ;
        int col = i%self.numberOfLine ;
        
        NSImageView *avatar = [[NSImageView alloc]initWithFrame:CGRectMake(self.contentEdgeInset.left + col*(self.itemSize.width + self.colSpace), self.contentEdgeInset.top + line*(self.lineSpace + self.itemSize.height), self.itemSize.height, self.itemSize.width)];
        avatar.tag = i;
//        [avatar setRoundCorner:YES];
//        AppUser *user = _images[i];
//        [avatar loadImage:user.portrait placeHolder:nil downloadFlag:avatar.tag];
//        [avatar clickMe:self tap:@selector(avatarClicked:) doubleTap:nil];
        
        [self addSubview:avatar];
        
        if (i == _images.count - 1) {
            self.height = avatar.bottom + self.contentEdgeInset.bottom;
//            [self setNeedsDisplay];
            [self layoutSubtreeIfNeeded];
        }
    }
}

- (void)avatarClicked:(NSImageView *)imageView
{
    if (self.clickedAvatarBlock) {
        self.clickedAvatarBlock(imageView.tag);
    }
}

@end
