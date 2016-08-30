//
//  ViewController.m
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/29.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "ViewController.h"

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
    CGFloat itemWidth = (self.autoLayoutImageView.width - 5 * 10) / 4;
    self.autoLayoutImageView.itemSize = CGSizeMake(itemWidth, itemWidth);
    self.autoLayoutImageView.lineSpace = 10;
    self.autoLayoutImageView.colSpace = 10;
    self.autoLayoutImageView.numberOfLine =3;
    
//    self.autoLayoutImageView.contentEdgeInset = UIEdgeInsetsMake(10, 10, 10, 10);
    __weak  typeof(self) weakSelf = self;
    self.autoLayoutImageView.addBlock = ^(){ //点击添加按钮
//        [weakSelf showAddActionSheet];
    };
    
    self.autoLayoutImageView.imageTapBlock = ^(NSArray *images , NSUInteger index)//点击了图片
    {
//        NSInteger count = [weakSelf.autoLayoutImageView uploadImages].count;
        NSLog(@"count:%ld",index);
//        PostMoodPicPreViewController *picPre = [[PostMoodPicPreViewController alloc]initWithImages:images];
//        picPre.currentIndex = index;
//        picPre.returnImageBlock = ^(NSArray *images)
//        {
//            
//            weakSelf.imageUploadCount = weakSelf.imageUploadCount - (count - images.count);
//            weakSelf.selectedCount = images.count;
//            if (images.count == 0) {
//                weakSelf.addImageLable.hidden = NO;
//            }
//            
//            [weakSelf.autoLayoutImageView setImages:[NSMutableArray arrayWithArray:images]];
//            //            if (images.count == 0) {
//            //                if (weakSelf.isPublic == 0) {
//            //                    weakSelf.isPublic = 1;
//            //                    [weakSelf.tableView reloadData];
//            //                }
//            //            }
//            [weakSelf layoutHeaderView];
//        };
//        [weakSelf.navigationController pushViewController:picPre animated:YES];
    };
    
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<9; i++) {
        [mutArray addObject:[NSImage imageNamed:[NSString stringWithFormat:@"%i.jpg",i+1]]];
    }
    
    [self.autoLayoutImageView setImages:mutArray];
}

@end
