//
//  ReAttribute.m
//  MacCloudRoom
//
//  Created by 郭韬 on 16/5/3.
//  Copyright © 2016年 33e9. All rights reserved.
//

#import "ReAttribute.h"
#import "RegexKitLite.h"
#import "HMRegexResult.h"
#import "HMEmotionAttachment.h"
#import "HMEmotionTool.h"
#import "MJExtension.h"

// 通知里面取出表情用的key
#define HMSelectedEmotion @"HMSelectedEmotion"
// 原创微博正文字体
#define HMStatusOrginalTextFont [NSFont systemFontOfSize:14]

// 转发微博正文字体
#define HMStatusHighTextColor [NSColor blueColor]

// 富文本里面出现的链接
#define HMLinkText @"HMLinkText"

// 富文本字体
#define HMStatusRichTextFont HMStatusOrginalTextFont
@implementation ReAttribute
- (NSAttributedString *)createAttributedText:(NSString *)text
{
  return  [self attributedStringWithText:text];
   // ReAttribute *reObject = [[self alloc] init];
   // return   [reObject attributedStringWithText:text];
}

- (NSAttributedString *)attributedStringWithText:(NSString *)text
{
    _isHaveEmotion = NO;
    // 1.匹配字符串
    NSArray *regexResults = [self regexResultsWithText:text];
    
    // 2.根据匹配结果，拼接对应的图片表情和普通文本
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    // 遍历
    [regexResults enumerateObjectsUsingBlock:^(HMRegexResult *result, NSUInteger idx, BOOL *stop) {
        HMEmotion *emotion = nil;
        if (result.isEmotion) { // 表情
            
            emotion = [HMEmotionTool emotionWithDesc:result.string];
            _isHaveEmotion = YES;
//            YWLogDebug(@"isEmotion string = %@",result.string);
        }
        
        if (emotion) { // 如果有表情
            // 创建附件对象
            HMEmotionAttachment *attach = [[HMEmotionAttachment alloc] init];
            NSLog(@"emotion->:%@",emotion);
            // 传递表情
            attach.emotion = emotion;
            /*
             NSImage *image1 = [[NSImage alloc] initWithContentsOfFile:path];
             [image1 setSize:NSMakeSize(24, 24)];
             NSTextAttachmentCell *attachmentCell = [[NSTextAttachmentCell alloc] initImageCell:image1];
             NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
             [attachment setAttachmentCell: attachmentCell ];
             NSAttributedString *attributedString = [NSAttributedString  attributedStringWithAttachment: attachment];
             */
            // NSLog(@"image = %@",attach.image);
            /*
             NSFileWrapper *imageFileWrapper = [[NSFileWrapper alloc] initRegularFileWithContents:[[NSImage imageNamed:imageName] TIFFRepresentation]];
             imageFileWrapper.filename = imageName;
             imageFileWrapper.preferredFilename = imageName;
             
             NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] initWithFileWrapper:imageFileWrapper];
             
             */
//                        NSFileWrapper *imageFileWrapper = [[NSFileWrapper alloc] initRegularFileWithContents:[attach.image TIFFRepresentation]];
//                        imageFileWrapper.filename = attach.image.name;
//                        imageFileWrapper.preferredFilename = attach.directory;
//                        attach.fileWrapper = imageFileWrapper;
//            
//                        NSImage *image = [[NSImage alloc] initWithContentsOfFile:attach.directory];
//            
//                        [image setSize:NSMakeSize(10, 10)];
            
//                        NSFileWrapper *imageFileWrapper = [[NSFileWrapper alloc] initRegularFileWithContents:[image TIFFRepresentation]];
//                        imageFileWrapper.filename = image.name;
//                        imageFileWrapper.preferredFilename =attach.directory;
//            
//                        NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] initWithFileWrapper:imageFileWrapper];
            
 
            
            NSFileWrapper *fileWrapper = [[NSFileWrapper alloc] initRegularFileWithContents:[NSData dataWithContentsOfFile:attach.directory]];
            [fileWrapper setPreferredFilename:[attach.directory lastPathComponent]];
            
            NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] initWithFileWrapper:fileWrapper];
            
            //            NSTextAttachment *imageAttachment = [[NSTextAttachment alloc]init];
            //            NSImage *image = [[NSImage alloc] initWithContentsOfFile:attach.directory];
            //            NSLog(@"image = %@",image);
            //            image = attach.image;
            //            [image setSize:NSMakeSize(12, 12)];
            //
            //            //NSLog(@"image1 = %@",image);
            //              NSTextAttachmentCell *attachmentCell = [[NSTextAttachmentCell alloc] initImageCell:image];
            //              [imageAttachment setAttachmentCell:attachmentCell];
            //
            //            [imageAttachment setBounds:NSMakeRect(12, 10, 14, 14)];
            // attach.bounds = CGRectMake(0, -3, HMStatusOrginalTextFont.xHeight, HMStatusOrginalTextFont.xHeight);
            
            // 将附件包装成富文本
            NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:imageAttachment];
            [attributedString appendAttributedString:attachString];
           // NSLog(@"attributedString = %@",attributedString);
        } else { // 非表情（直接拼接普通文本）
            NSMutableAttributedString *substr = [[NSMutableAttributedString alloc] initWithString:result.string];
            
            // 匹配#话题#
            NSString *trendRegex = @"#[a-zA-Z0-9\\u4e00-\\u9fa5]+#";
            [result.string enumerateStringsMatchedByRegex:trendRegex usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
                [substr addAttribute:NSForegroundColorAttributeName value:HMStatusHighTextColor range:*capturedRanges];
                [substr addAttribute:HMLinkText value:*capturedStrings range:*capturedRanges];
            }];
            
            // 匹配@提到
            NSString *mentionRegex = @"@[a-zA-Z0-9\\u4e00-\\u9fa5\\-_]+";
            [result.string enumerateStringsMatchedByRegex:mentionRegex usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
                [substr addAttribute:NSForegroundColorAttributeName value:HMStatusHighTextColor range:*capturedRanges];
                [substr addAttribute:HMLinkText value:*capturedStrings range:*capturedRanges];
            }];
            
            // 匹配超链接
           /* NSString *httpRegex = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/"
            "[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/"
            "=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/"
            "[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
            */
           // NSString *httpRegex = @"^(((ht|f)tp(s?))\\://)?(www.|[a-zA-Z].)[a-zA-Z0-9\\-\\.]+\\.(com|edu|gov|mil|net|org|biz|info|name|museum|us|ca|uk)(\\:[0-9]+)*(/($|[a-zA-Z0-9\\.\\,\\;\?\'\\\\+&amp;%\\$#\\=~_\\-]+))*$";
             NSString *httpRegex = @"((http|ftp|https)://)?(([a-zA-Z0-9\\._-]+\\.[a-zA-Z]{2,6})|([0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}))(:[0-9]{1,4})*(/[a-zA-Z0-9\\&%_\\./-~-]*)?";
            [result.string enumerateStringsMatchedByRegex:httpRegex usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
                
                [substr addAttribute:NSLinkAttributeName value:*capturedStrings range:*capturedRanges];
                [substr addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:*capturedRanges];
                
                //[substr addAttribute:NSForegroundColorAttributeName value:HMStatusHighTextColor range:*capturedRanges];
                //[substr addAttribute:HMLinkText value:*capturedStrings range:*capturedRanges];
            }];
            
            //匹配邮箱
            NSString *emailRegex = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
            [result.string enumerateStringsMatchedByRegex:emailRegex usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
                
                [substr addAttribute:NSForegroundColorAttributeName value:HMStatusHighTextColor range:*capturedRanges];
                [substr addAttribute:HMLinkText value:*capturedStrings range:*capturedRanges];
            }];
            
            //匹配电话号码
            NSString *numberRegex = @"(\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$";
            [result.string enumerateStringsMatchedByRegex:numberRegex usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
                
                [substr addAttribute:NSForegroundColorAttributeName value:HMStatusHighTextColor range:*capturedRanges];
                [substr addAttribute:HMLinkText value:*capturedStrings range:*capturedRanges];
            }];
            
            [attributedString appendAttributedString:substr];
        }
    }];
    
    return attributedString;
}

- (NSAttributedString *)attributedFontStringWithText:(NSString *)text
{
    _isHaveEmotion = NO;
    // 1.匹配字符串
    NSArray *regexResults = [self regexResultsWithText:text];
    
    // 2.根据匹配结果，拼接对应的图片表情和普通文本
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    // 遍历
    [regexResults enumerateObjectsUsingBlock:^(HMRegexResult *result, NSUInteger idx, BOOL *stop) {
        HMEmotion *emotion = nil;
        if (result.isEmotion) { // 表情
            
            emotion = [HMEmotionTool emotionWithDesc:result.string];
            _isHaveEmotion = YES;
            //            YWLogDebug(@"isEmotion string = %@",result.string);
        }
        
        if (emotion) { // 如果有表情
            
            NSLog(@"string:%@",result.string);
            // 创建附件对象
            HMEmotionAttachment *attach = [[HMEmotionAttachment alloc] init];
            // 传递表情
            attach.emotion = emotion;
            
            NSMutableAttributedString *emotionString = [[NSMutableAttributedString alloc] initWithString:@"帅"];
            [emotionString addAttribute:NSFontAttributeName value:[NSFont systemFontOfSize:25] range:NSMakeRange(0, 1)];
            [attributedString appendAttributedString:emotionString];
            
        } else { // 非表情（直接拼接普通文本）
            
            NSLog(@"substr:%@",result.string);
            
            NSMutableAttributedString *substr = [[NSMutableAttributedString alloc] initWithString:result.string];
            [substr addAttribute:NSFontAttributeName value:[NSFont systemFontOfSize:15] range:NSMakeRange(0, substr.length)];

            
            // 匹配#话题#
            NSString *trendRegex = @"#[a-zA-Z0-9\\u4e00-\\u9fa5]+#";
            [result.string enumerateStringsMatchedByRegex:trendRegex usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
                [substr addAttribute:NSForegroundColorAttributeName value:HMStatusHighTextColor range:*capturedRanges];
                [substr addAttribute:HMLinkText value:*capturedStrings range:*capturedRanges];
            }];
            
            // 匹配@提到
            NSString *mentionRegex = @"@[a-zA-Z0-9\\u4e00-\\u9fa5\\-_]+";
            [result.string enumerateStringsMatchedByRegex:mentionRegex usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
                [substr addAttribute:NSForegroundColorAttributeName value:HMStatusHighTextColor range:*capturedRanges];
                [substr addAttribute:HMLinkText value:*capturedStrings range:*capturedRanges];

            }];
            
            // 匹配超链接
            NSString *httpRegex = @"((http|ftp|https)://)?(([a-zA-Z0-9\\._-]+\\.[a-zA-Z]{2,6})|([0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}))(:[0-9]{1,4})*(/[a-zA-Z0-9\\&%_\\./-~-]*)?";
            [result.string enumerateStringsMatchedByRegex:httpRegex usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
                
                [substr addAttribute:NSLinkAttributeName value:*capturedStrings range:*capturedRanges];
                [substr addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:*capturedRanges];
                
            }];
            
            //匹配邮箱
            NSString *emailRegex = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
            [result.string enumerateStringsMatchedByRegex:emailRegex usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
                
                [substr addAttribute:NSForegroundColorAttributeName value:HMStatusHighTextColor range:*capturedRanges];
                [substr addAttribute:HMLinkText value:*capturedStrings range:*capturedRanges];

            }];
            
            //匹配电话号码
            NSString *numberRegex = @"(\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$";
            [result.string enumerateStringsMatchedByRegex:numberRegex usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
                
                [substr addAttribute:NSForegroundColorAttributeName value:HMStatusHighTextColor range:*capturedRanges];
                [substr addAttribute:HMLinkText value:*capturedStrings range:*capturedRanges];

            }];
            
            [attributedString appendAttributedString:substr];
        }
    }];
    
    return attributedString;
}


/**
 *  根据字符串计算出所有的匹配结果（已经排好序）
 *
 *  @param text 字符串内容
 */
- (NSArray *)regexResultsWithText:(NSString *)text
{
    // 用来存放所有的匹配结果
    NSMutableArray *regexResults = [NSMutableArray array];
    
    // 匹配表情
    NSString *emotionRegex = @"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]";
    
    [text enumerateStringsMatchedByRegex:emotionRegex usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
        HMRegexResult *rr = [[HMRegexResult alloc] init];
        rr.string = *capturedStrings;
        rr.range = *capturedRanges;
        rr.emotion = YES;
        [regexResults addObject:rr];
    }];
    
    // 匹配非表情
    [text enumerateStringsSeparatedByRegex:emotionRegex usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
        HMRegexResult *rr = [[HMRegexResult alloc] init];
        rr.string = *capturedStrings;
        rr.range = *capturedRanges;
        rr.emotion = NO;
        [regexResults addObject:rr];
    }];
    
    // 排序
    [regexResults sortUsingComparator:^NSComparisonResult(HMRegexResult *rr1, HMRegexResult *rr2) {
        NSUInteger loc1 = rr1.range.location;
        NSUInteger loc2 = rr2.range.location;
        return [@(loc1) compare:@(loc2)];
    }];
    return regexResults;
}
@end
