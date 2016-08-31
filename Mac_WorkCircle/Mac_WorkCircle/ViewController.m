//
//  ViewController.m
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/29.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "ViewController.h"
#import "WCPictureShowWindowController.h"

@interface ViewController (){
    NSArray *items;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addGroupViews];
    

//    items = @[@{@"image":@"1",@"name":@"陈帅",@"forwardText":@"哈哈哈哈，开心呀",@"originalText":@"祝尘帅生日快乐永远18岁",@"imageArray":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],@"fileArray":@[@"生日照片1.zip",@"生日照片2.zip",@"生日照片3.zip",@"生日照片4.zip"]},
//              @{@"image":@"1",@"name":@"陈帅",@"forwardText":@"哈哈哈哈，开心呀",@"originalText":@"祝尘帅生日快乐永远18岁",@"imageArray":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],@"fileArray":@[@"生日照片1.zip",@"生日照片2.zip",@"生日照片3.zip",@"生日照片4.zip"]},
//              @{@"image":@"1",@"name":@"陈帅",@"forwardText":@"哈哈哈哈，开心呀",@"originalText":@"祝尘帅生日快乐永远18岁",@"imageArray":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],@"fileArray":@[@"生日照片1.zip",@"生日照片2.zip",@"生日照片3.zip",@"生日照片4.zip"]},
//              @{@"image":@"1",@"name":@"陈帅",@"forwardText":@"哈哈哈哈，开心呀",@"originalText":@"祝尘帅生日快乐永远18岁",@"imageArray":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],@"fileArray":@[@"生日照片1.zip",@"生日照片2.zip",@"生日照片3.zip",@"生日照片4.zip"]}];
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

//#pragma mark - delegate
//- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
//{
//    return items.count;
//}
//
//- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
//{
//    static NSString *NODE_CELL_ID = @"AtTableCellViewID";
//    NSTableCellView *cell = [tableView makeViewWithIdentifier:NODE_CELL_ID owner:self];
//    if (!cell) {
//        cell = [[NSTableCellView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
//        cell.identifier = NODE_CELL_ID;
//    }
//    
//    
//    return cell;
//}
//
//- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
//{
//    return 20;
//}
//
//- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row
//{
//    return YES;
//}

- (void)addGroupViews{
    //九宫格图片VIew
    self.autoLayoutImageView = [[AutolayoutImageView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    [self.view addSubview:self.autoLayoutImageView];
    
    self.autoLayoutImageView.backgroundColor = [NSColor whiteColor];
    CGFloat itemWidth = (self.autoLayoutImageView.width - 4 * 10) / 3;
    self.autoLayoutImageView.itemSize = CGSizeMake(itemWidth, itemWidth);
    self.autoLayoutImageView.lineSpace = 10;
    self.autoLayoutImageView.colSpace = 10;
    self.autoLayoutImageView.numberOfLine =3;
    self.autoLayoutImageView.showAddButton = NO;
    
    __weak  typeof(self) weakSelf = self;
    self.autoLayoutImageView.addBlock = ^(){ //点击添加按钮

    };
    
    self.autoLayoutImageView.imageTapBlock = ^(NSArray *images , NSUInteger index)//点击了图片
    {
        [[WCPictureShowWindowController sharedInstancePictures:images index:index] showWindow:weakSelf];

    };
    
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<8; i++) {
        [mutArray addObject:[NSImage imageNamed:[NSString stringWithFormat:@"%i.jpg",i+1]]];
    }
    
    [self.autoLayoutImageView setImages:mutArray];
    
    
//    //九宫格图片VIew AutoGroupCellImageView
//    self.autoGroupCellImageView = [[AutoGroupCellImageView alloc] initWithFrame:CGRectMake(0, 500, 400, 400)];
//    [self.view addSubview:self.autoGroupCellImageView];
//    
//    self.autoGroupCellImageView.backgroundColor = [NSColor whiteColor];
//    CGFloat itemWidth2 = (self.autoLayoutImageView.width - 4 * 10) / 3;
//    self.autoGroupCellImageView.itemSize = CGSizeMake(itemWidth2, itemWidth2);
//    self.autoGroupCellImageView.lineSpace = 10;
//    self.autoGroupCellImageView.colSpace = 10;
//    self.autoGroupCellImageView.numberOfLine =3;
//    self.autoGroupCellImageView.showAddButton = NO;
//    
//    self.autoGroupCellImageView.addBlock = ^(){ //点击添加按钮
//
//    };
//    
//    self.autoGroupCellImageView.imageTapBlock = ^(NSArray *images , NSUInteger index)//点击了图片
//    {
//        NSLog(@"autoGroupCellImageView_count:%ld",index);
//    };
//    
//    [self.autoGroupCellImageView setImageUrls:mutArray];
//    
//    //九宫格图片VIew AutoReminderView
//    self.autoReminderView = [[AutoReminderView alloc] initWithFrame:CGRectMake(500, 0, 400, 400)];
//    [self.view addSubview:self.autoReminderView];
//    
//    self.autoReminderView.backgroundColor = [NSColor whiteColor];
//    CGFloat itemWidth3 = (self.autoReminderView.width - 4 * 10) / 3;
//    self.autoReminderView.itemSize = CGSizeMake(itemWidth3, itemWidth3);
//    self.autoReminderView.lineSpace = 10;
//    self.autoReminderView.colSpace = 10;
//    self.autoReminderView.numberOfLine =3;
//    self.autoReminderView.showAddButton = NO;
//    
//    self.autoReminderView.addBlock = ^(){ //点击添加按钮
//        
//    };
//    
//    self.autoReminderView.imageTapBlock = ^(NSArray *images , NSUInteger index)//点击了图片
//    {
//        NSLog(@"autoReminderView_count:%ld",index);
//    };
//    
//    [self.autoReminderView setImages:mutArray];
}

@end
