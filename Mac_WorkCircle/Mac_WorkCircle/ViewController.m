//
//  ViewController.m
//  Mac_WorkCircle
//
//  Created by pengwenjie on 16/8/29.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "ViewController.h"
#import "WCPictureShowWindowController.h"
#import "WorkCircleCell.h"
#import "YWModel.h"

@interface ViewController ()<NSTableViewDelegate,NSTableViewDataSource>{
    NSMutableArray *items;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self makeBaseUI];
    
//    [self addGroupViews];    

    items = [NSMutableArray arrayWithCapacity:0];
    
    NSArray *array = @[@{@"image":@"1",@"name":@"陈帅",@"forwardText":@"",@"originalText":@"祝尘帅生日快乐永远18岁-祝尘帅生日快乐永远18岁-祝尘帅生日快乐永远18岁-祝尘帅生日快乐永远18岁-祝尘帅生日快乐永远18岁",@"imageArray":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],@"fileArray":@[]},
              @{@"image":@"1",@"name":@"陈帅",@"forwardText":@"哈哈哈哈，开心呀",@"originalText":@"祝尘帅生日快乐永远18岁",@"imageArray":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],@"fileArray":@[@"生日照片1.zip",@"生日照片2.zip",@"生日照片3.zip",@"生日照片4.zip"]},
              @{@"image":@"1",@"name":@"陈帅",@"forwardText":@"哈哈哈哈，开心呀-哈哈哈哈，开心呀-哈哈哈哈，开心呀-哈哈哈哈，开心呀",@"originalText":@"祝尘帅生日快乐永远18岁",@"imageArray":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],@"fileArray":@[@"生日照片1.zip"]},
              @{@"image":@"1",@"name":@"陈帅",@"forwardText":@"哈哈哈哈，开心呀",@"originalText":@"祝尘帅生日快乐永远18岁-祝尘帅生日快乐永远18岁-祝尘帅生日快乐永远18岁",@"imageArray":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],@"fileArray":@[@"生日照片1.zip",@"生日照片2.zip",@"生日照片3.zip"]}];
    
    for (NSDictionary *temp in array) {
        YWModel *model = [[YWModel alloc] init];
        model.image = temp[@"image"];
        model.name = temp[@"name"];
        model.forwardText = temp[@"forwardText"];
        model.originalText = temp[@"originalText"];
        model.imageArray = temp[@"imageArray"];
        model.fileArray = temp[@"fileArray"];
        [items addObject:model];
    }
    
    [self.workTableView reloadData];
    
    NSLog(@"items:%ld",items.count);
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

// 主页
- (IBAction)showWorkCircleBtnDown:(id)sender {
    
}

// 发布工作圈
- (IBAction)sendWorkCircleBtnDown:(id)sender {

}

- (void)makeBaseUI
{
    // create a table view and a scroll view
    NSScrollView * tableContainer = [[NSScrollView alloc] initWithFrame:NSMakeRect(0, 0, 340, 560)];
    self.workTableView = [[NSTableView alloc] initWithFrame:NSMakeRect(0, 100, 340, 560)];
    self.workTableView.delegate = self;
    self.workTableView.dataSource = self;
    [self.view addSubview:self.workTableView];

    // create columns for our table
    NSTableColumn * column1 = [[NSTableColumn alloc] initWithIdentifier:@"WorkCircleColum"];
    [column1 setWidth:340];
    // generally you want to add at least one column to the table view.
    [self.workTableView addTableColumn:column1];
    self.workTableView.headerView.hidden = YES;
    [self.workTableView setDelegate:self];
    [self.workTableView setDataSource:self];
    //  [memberTableView setHidden:YES];
    [self.workTableView reloadData];
    // embed the table view in the scroll view, and add the scroll view to our window.
    [tableContainer setDocumentView:self.workTableView];
    [tableContainer setHasVerticalScroller:YES];
    [self.view addSubview:tableContainer];
    
    tableContainer.autoresizingMask =  NSViewMinXMargin|NSViewMinYMargin|NSViewHeightSizable;
}

#pragma mark - delegate
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return items.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    static NSString *NODE_CELL_ID = @"WorkCircleCellID";
    WorkCircleCell *cell = [tableView makeViewWithIdentifier:NODE_CELL_ID owner:self];
    if (!cell) {
        cell = [[WorkCircleCell alloc] initWithFrame:CGRectMake(0, 0, 330, 330)];
        cell.identifier = NODE_CELL_ID;
    }
    
    [cell configWithModel:items[row]];
    
    return cell;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return [[WorkCircleCell alloc] getCellHeightWithModel:items[row]];
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row
{
    return NO;
}

@end
