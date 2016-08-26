//
//  ReAttribute.h
//  MacCloudRoom
//
//  Created by 郭韬 on 16/5/3.
//  Copyright © 2016年 33e9. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReAttribute : NSObject
@property (assign) BOOL isHaveEmotion;
- (NSAttributedString *)createAttributedText:(NSString *)text;
- (NSAttributedString *)attributedFontStringWithText:(NSString *)text;
@end
