//
//  CIImage+Extension.h
//  MacCloudRoom
//
//  Created by ghs on 2016/12/30.
//  Copyright © 2016年 33e9. All rights reserved.
//

#import <CoreImage/CoreImage.h>
#import <AppKit/AppKit.h>
@interface CIImage (Extension)
- (NSImage *)createNonInterpolatedWithSize:(CGFloat)size;
@end
