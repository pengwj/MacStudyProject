//
//  AtObj.h
//  test@
//
//  Created by pengwenjie on 16/8/3.
//  Copyright © 2016年 彭文杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AtObj : NSObject

@property(nonatomic,strong) NSString *user; //@用户名
@property(nonatomic,assign) NSInteger userIndex; //在输入框的下标
@property(nonatomic,assign) NSRange range;

@end
