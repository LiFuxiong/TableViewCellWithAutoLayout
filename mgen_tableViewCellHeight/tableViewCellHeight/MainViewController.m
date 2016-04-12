//
//  MainViewController.m
//  tableViewCellHeight
//
//  Created by MgenLiu on 13-12-23.
//  Copyright (c) 2013年 Mgen. All rights reserved.
//

#import "MainViewController.h"
#import "MyCell.h"

@interface MainViewController ()
{
    //测试数据源
    NSMutableArray *_dataSource;
}

@end

@implementation MainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //viewDidLoad 初始化
    _dataSource = [NSMutableArray array];
    for (int i = 0; i < 1000; i++)
    {
        [_dataSource addObject:[NSString stringWithFormat:@"%d", i]];
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%@", [[GlobalCounter getInstance] dictionary]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //log
    [[GlobalCounter getInstance] add:@"get cell"];
    
    static NSString *CellIdentifier = @"MyCell";
    //注意在heightForRowAtIndexPath:indexPath无法使用dequeueReusableCellWithIdentifier:forIndexPath:
    MyCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //用dequeueReusableCellWithIdentifier:就得判断Cell为nil的情况
    //如果在Storyboard中Prototype Cells中设置了具体Table View Cell的Identifier也是"MyCell"（也就是重用ID），那这里不会有返回nil的情况
    if (!cell)
    {
        cell = [[MyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [self loadCellContent:cell indexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //log
    [[GlobalCounter getInstance] add:@"get height"];
    
    //只创建一个cell用作测量高度
    static MyCell *cell = nil;
    
    if (!cell)
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"MyCell"];

    [self loadCellContent:cell indexPath:indexPath];
    return [self getCellHeight:cell];
}


- (CGFloat)getCellHeight:(UITableViewCell*)cell
{
    [cell layoutIfNeeded];
    [cell updateConstraintsIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;
}

- (void)loadCellContent:(MyCell*)cell indexPath:(NSIndexPath*)indexPath
{
    //这里把数据设置给Cell
    cell.titleLabel.text = [_dataSource objectAtIndex:indexPath.row];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
