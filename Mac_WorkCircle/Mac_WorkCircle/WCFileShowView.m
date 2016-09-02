//
//  WCFileShowView.m
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/9/1.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "WCFileShowView.h"

@implementation WCFileShowView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)setFileView:(NSArray *)fileArray
{
    // @[@"生日照片1.zip",@"生日照片2.zip",@"生日照片3.zip",@"生日照片4.zip"]
    //
    
    for (int i=0; i<fileArray.count; i++) {
        NSTextField *text = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 30*i, 300, 30)];
        text.stringValue = fileArray[i];
        [self addSubview:text];
    }
}

- (BOOL)isFlipped
{
    return YES;
}

@end
