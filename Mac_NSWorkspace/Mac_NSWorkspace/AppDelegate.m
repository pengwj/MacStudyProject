//
//  AppDelegate.m
//  Mac_NSWorkspace
//
//  Created by pengwenjie on 16/9/13.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}



//- (IBAction) launchApplication:(id) sender
//{
//    NSWorkspace * workspace = [NSWorkspace sharedWorkspace];
//    //BOOL wasLaunched = [workspace launchApplication:@"Safari"];
//    
//    // launch without activation
//    //
//    BOOL wasLaunched = [workspace launchAppWithBundleIdentifier: @"com.apple.Safari"
//                                                        options: NSWorkspaceLaunchWithoutActivation
//                                 additionalEventParamDescriptor: NULL
//                                               launchIdentifier: nil];
//    if ( wasLaunched )
//        NSLog (@"Safari was launched");
//    else
//        NSLog (@"Safari was not launched");
//    
//    NSArray * apps = [workspace valueForKeyPath:@"launchedApplications.NSApplicationName"];
//    self.launchedApplications = [NSString stringWithFormat:@"Launched Applications:\n%@", apps];
//    NSLog(@"Launched Applications:\n%@", apps);
//}
//
//- (IBAction) openPdfByDefault:(id) sender
//{
//    NSString * path    = @"/Developer/About Xcode and iOS SDK.pdf";
//    NSURL    * fileURL = [NSURL fileURLWithPath: path];
//    
//    NSWorkspace * workspace = [NSWorkspace sharedWorkspace];
//    [workspace openURL: fileURL];
//}
//
//- (IBAction) openPdfBySafari:(id) sender
//{
//    NSString * path    = @"/Developer/About Xcode and iOS SDK.pdf";
//    NSURL    * fileURL = [NSURL fileURLWithPath: path];
//    
//    NSWorkspace * workspace = [NSWorkspace sharedWorkspace];
//    [workspace openFile:[fileURL path] withApplication:@"Safari"];
//}
//
//- (IBAction) selectFileInFinder:(id) sender
//{
//    NSString * path    = @"/Developer/About Xcode and iOS SDK.pdf";
//    NSURL    * fileURL = [NSURL fileURLWithPath: path];
//    
//    NSWorkspace * workspace = [NSWorkspace sharedWorkspace];
//    [workspace selectFile:[fileURL path] inFileViewerRootedAtPath:nil];
//}
//
//- (IBAction) gatherFileInfo:(id) sender
//{
//    NSString * path    = @"/Developer/About Xcode and iOS SDK.pdf";
//    NSURL    * fileURL = [NSURL fileURLWithPath: path];
//    
//    NSWorkspace * workspace = [NSWorkspace sharedWorkspace];
//    
//    NSString    * appName;
//    NSString    * fileType;
//    
//    [workspace getInfoForFile: [fileURL path]
//                  application: &appName
//                         type: &fileType];
//    
//    BOOL removable = NO;
//    BOOL writeable = NO;
//    BOOL unmountable = NO;
//    NSString *description;
//    NSString *fileSystemType;
//    
//    [workspace getFileSystemInfoForPath:[fileURL path]
//                            isRemovable: &removable
//                             isWritable: &writeable
//                          isUnmountable: &unmountable
//                            description: &description
//                                   type: &fileSystemType];
//    
//    self.fileInfo = [NSString stringWithFormat:
//                     @"AppName: %@\ntype: %@"
//                     @"\nremoveable: %d\nwriteable: %d\nunmountable: %d"
//                     @"\ndescription: %@\nfileSystemType: %@",
//                     appName, fileType,
//                     removable, writeable, unmountable,
//                     description, fileSystemType];
//    NSLog (@" >> gather file info:\n%@", self.fileInfo);
//}
//
//- (IBAction) copyFileToDesktop:(id) sender
//{
//    NSString * name  = @"About Xcode and iOS SDK.pdf";
//    NSArray  * files = [NSArray arrayWithObject: name];
//    
//    NSWorkspace * workspace = [NSWorkspace sharedWorkspace];
//    
//    [workspace performFileOperation: NSWorkspaceCopyOperation
//                             source: @"/Developer/"
//                        destination: @"/Users/tianyouhui/Desktop/"
//                              files: files
//                                tag: 0];
//}
//
//- (IBAction) moveFileToTrash:(id) sender
//{
//    NSString * name  = @"About Xcode and iOS SDK.pdf";
//    NSArray  * files = [NSArray arrayWithObject: name];
//    
//    NSWorkspace * workspace = [NSWorkspace sharedWorkspace];
//    
//    [workspace performFileOperation: NSWorkspaceRecycleOperation
//                             source: @"/Users/tianyouhui/Desktop/"
//                        destination: @""
//                              files: files
//                                tag: 0];
//}
//
//- (IBAction) gatherIconOfFile:(id) sender
//{
//    NSString * path    = @"/Developer/About Xcode and iOS SDK.pdf";
//    NSURL    * fileURL = [NSURL fileURLWithPath: path];
//    
//    NSWorkspace * workspace = [NSWorkspace sharedWorkspace];
//    
//    self.icon = [workspace iconForFile: [fileURL path]];
//    //NSString    * path  = [workspace fullPathForApplication:@"Safari"];
//    //self.xcodeIcon  = [workspace iconForFile: path];
//    
//    self.xcodeIcon = [workspace iconForFileType:@"xcodeproj"];
//}
//
//- (IBAction) openUrlBySafari:(id) sender
//{
//    NSURL * url = [NSURL URLWithString:@"http://blog.csdn.net/kesalin/"];
//    
//    NSWorkspace * workspace = [NSWorkspace sharedWorkspace];
//    
//    [workspace openURL: url];
//}


@end
