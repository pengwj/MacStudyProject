//
//  YWModel.h
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/9/1.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YWModel : NSObject

/*
 @{
 @"image":@"1",
 @"name":@"陈帅",
 @"forwardText":@"哈哈哈哈，开心呀",
 @"originalText":@"祝尘帅生日快乐永远18岁",
 @"imageArray":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],
 @"fileArray":@[@"生日照片1.zip",@"生日照片2.zip",@"生日照片3.zip",@"生日照片4.zip"]
 }
 */

@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *forwardText;
@property (nonatomic, strong) NSString *originalText;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *fileArray;


@end
