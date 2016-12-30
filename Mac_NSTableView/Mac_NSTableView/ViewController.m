//
//  ViewController.m
//  Mac_NSTableView
//
//  Created by pengwenjie on 16/9/21.
//  Copyright © 2016年 pengwenjie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSTableViewDelegate,NSTableViewDataSource>{
    NSTableView *codeTableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)StoryBoardTable:(id)sender {
    NSLog(@"未完成");
}

- (IBAction)codeTable:(id)sender {
    // table
    NSScrollView *tableContainer = [[NSScrollView alloc] initWithFrame:NSMakeRect(0, 0, 500, 300)];
    codeTableView = [[NSTableView alloc] initWithFrame:CGRectMake(0, 0, 500, 200)];
    [self.view addSubview:codeTableView];
    
    NSTableColumn *codeColumn = [[NSTableColumn alloc] initWithIdentifier:@"FileTableViewCell"];
    [codeColumn setWidth:tableContainer.frame.size.width];
    
    [codeTableView addTableColumn:codeColumn];
    codeTableView.headerView.hidden = YES;
    [codeTableView setDelegate:self];
    [codeTableView setDataSource:self];
    
    [codeTableView reloadData];
    [tableContainer setDocumentView:codeTableView];
    [tableContainer setHasVerticalScroller:YES];
    [self.view addSubview:tableContainer];
    
    NSLog(@"codeTableView:%@",NSStringFromRect(codeTableView.frame));
    NSLog(@"tableContainer:%@",NSStringFromRect(tableContainer.frame));
}

#pragma mark -  NSTableViewDataSource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
        return 200;
}
#pragma mark -  NSTableViewDelegate
- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
        return 100;

}

- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row
{
    
        NSTableCellView *file = [tableView makeViewWithIdentifier:@"FileTableViewCell" owner:self];
        
        if (file == nil) {
        
            NSLog(@"新建");
            file = [[NSTableCellView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
            file.identifier = @"FileTableViewCell";
        } else {
            NSLog(@"复用");
        }
    
    
    if ([tableView respondsToSelector:@selector(usesStaticContents)])
        //Method currenly only available on OS X 10.10 or later
    {
        
        tableView.usesStaticContents = NO;
        
    }
    file.textField.stringValue = [NSString stringWithFormat:@"%ld",row];
    file.textField.backgroundColor = [NSColor grayColor];
    
        return file;
    
}
- (BOOL)selectionShouldChangeInTableView:(NSTableView *)tableView
{
    return YES;
}

//- (NSIndexSet *)tableView:(NSTableView *)tableView selectionIndexesForProposedSelection:(NSIndexSet *)proposedSelectionIndexes
//{
//    return proposedSelectionIndexes;
//}

////自定义选中行的高亮的颜色
//- (NSTableRowView *)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row{
//    
//    MyTableRowView *rowView = [[MyTableRowView alloc] init];
//    return rowView;
//}


@end
