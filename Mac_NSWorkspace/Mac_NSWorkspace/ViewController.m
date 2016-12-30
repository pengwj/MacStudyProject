//
//  ViewController.m
//  Mac_NSWorkspace
//
//  Created by pengwenjie on 16/9/13.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *imageURL = @"http://file.umlink.cn/download?category=pub&type=im&expiryDate=20161013165219&fileId=ChnWVVfXvkOEBQF_AAAAAJprGMk860&picSize=200x320&srcFileId=CnQnzVfXvkOEeEwtAAAAAI4rJtI309&srcPicSize=1200x1920";
    NSRange httpKeyRange = [imageURL rangeOfString:@"http" options:NSBackwardsSearch];
    NSLog(@"httpKeyRange:%@",NSStringFromRange(httpKeyRange));
    
    NSRange fileKeyRange = [imageURL rangeOfString:@"://file" options:NSBackwardsSearch];
    NSLog(@"fileKeyRange:%@",NSStringFromRange(fileKeyRange));
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)openFileDown:(id)sender {
   
    NSString *imageURL = @"http://file.umlink.cn/download?category=pub&type=im&expiryDate=20161013165219&fileId=ChnWVVfXvkOEBQF_AAAAAJprGMk860&picSize=200x320&srcFileId=CnQnzVfXvkOEeEwtAAAAAI4rJtI309&srcPicSize=1200x1920";
    
    NSLog(@"originURL:%@",[self getOriginURL:imageURL]);

    // [[NSWorkspace sharedWorkspace] openFile:@"/Users/33e9/Library/Caches/App/ChatImages/s014.jpg"];
}

- (NSString*)getOriginURL:(NSString*)imageURL
{
    NSRange fileldKeyRange = [imageURL rangeOfString:@"&fileId=" options:NSBackwardsSearch];
    NSRange srcFileIdKeyRange = [imageURL rangeOfString:@"&srcFileId=" options:NSBackwardsSearch];

    NSRange httpUrlRange = NSMakeRange(0, fileldKeyRange.location);
    NSRange thumbnailUrlRange = NSMakeRange(fileldKeyRange.location, srcFileIdKeyRange.location-fileldKeyRange.location);
    NSRange originalUrlRange = NSMakeRange(srcFileIdKeyRange.location, imageURL.length-srcFileIdKeyRange.location);
    
    if (!NSLocationInRange(originalUrlRange.location+originalUrlRange.length-1, NSMakeRange(0, imageURL.length))) {
        return imageURL;
    }
    
    NSString *httpUrl = [imageURL substringWithRange:httpUrlRange];
    NSString *thumbnailUrl = [imageURL substringWithRange:thumbnailUrlRange];
    NSString *originalUrl = [imageURL substringWithRange:originalUrlRange];
    
    NSString *imageOriginURL = [NSString stringWithFormat:@"%@%@",httpUrl,originalUrl];

    return imageOriginURL;
}

//- (NSString*)getOriginURL:(NSString*)imageURL
//{
//    NSRange srcFileIdKeyRange = [imageURL rangeOfString:@"&srcFileId=" options:NSBackwardsSearch];
//    NSRange srcPicSizeKeyRange = [imageURL rangeOfString:@"&srcPicSize=" options:NSBackwardsSearch];
//    NSRange fileldKeyRange = [imageURL rangeOfString:@"&fileId=" options:NSBackwardsSearch];
//    NSRange picSizeKeyRange = [imageURL rangeOfString:@"&picSize=" options:NSBackwardsSearch];
//    
//    NSRange fileldValueRange = NSMakeRange(fileldKeyRange.location+fileldKeyRange.length, picSizeKeyRange.location-(fileldKeyRange.location+fileldKeyRange.length));
//    NSRange picSizeValueRange = NSMakeRange(picSizeKeyRange.location+picSizeKeyRange.length, srcFileIdKeyRange.location-(picSizeKeyRange.location+picSizeKeyRange.length));
//    NSRange srcFileIdValueRange = NSMakeRange(srcFileIdKeyRange.location+srcFileIdKeyRange.length, srcPicSizeKeyRange.location-(srcFileIdKeyRange.location+srcFileIdKeyRange.length));
//    NSRange srcPicSizeValueRange = NSMakeRange(srcPicSizeKeyRange.location+srcPicSizeKeyRange.length, imageURL.length-(srcPicSizeKeyRange.location+srcPicSizeKeyRange.length));
//    
//    //    if (!NSLocationInRange(srcFileIdValueRange.location+srcFileIdValueRange.length,NSMakeRange(0, imageURL.length))) {
//    //        NSLog(@"srcFileIdValueRange_out");
//    //        return imageURL;
//    //    }
//    //
//    //    if (!NSLocationInRange(srcPicSizeValueRange.location+srcPicSizeValueRange.length-1,NSMakeRange(0, imageURL.length))) {
//    //        NSLog(@"srcPicSizeValueRange_out");
//    //        return imageURL;
//    //    }
//    //
//    //    if (!NSLocationInRange(picSizeValueRange.location+picSizeValueRange.length-1,NSMakeRange(0, imageURL.length))) {
//    //        NSLog(@"picSizeValueRange_out");
//    //        return imageURL;
//    //    }
//    //
//    //    if (!NSLocationInRange(fileldValueRange.location+fileldValueRange.length,NSMakeRange(0, imageURL.length))) {
//    //        NSLog(@"fileldValueRange_out");
//    //        return imageURL;
//    //    }
//    
//    NSString *originSrcFileId = [imageURL substringWithRange:srcFileIdValueRange];
//    NSString *originSrcPicSize = [imageURL substringWithRange:srcPicSizeValueRange];
//    
//    NSString *thumbnailFileId = [imageURL substringWithRange:fileldValueRange];
//    NSString *thumbnailPicSize = [imageURL substringWithRange:picSizeValueRange];
//    
//    NSLog(@"originSrcFileId:%@",originSrcFileId);
//    NSLog(@"originSrcPicSize:%@",originSrcPicSize);
//    NSLog(@"thumbnailFileId:%@",thumbnailFileId);
//    NSLog(@"thumbnailPicSize:%@",thumbnailPicSize);
//    
//    NSMutableString *imageOriginURL = [[NSMutableString alloc] initWithString:imageURL];
//    
//    [imageOriginURL replaceCharactersInRange:picSizeValueRange withString:originSrcPicSize];
//    [imageOriginURL replaceCharactersInRange:fileldValueRange withString:originSrcFileId];
//    
//    return imageOriginURL;
//}

@end
