//
//  ViewController.m
//  TestHomeworks
//
//  Created by Inocchi on 2014/06/15.
//  Copyright (c) 2014年 Inocchi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    table.delegate = self;
    table.dataSource = self;
    
    nameArray = [[NSMutableArray alloc]initWithObjects:
                 @"az",
                 @"inocchi",
                 @"massy", nil];
    
    imageArray = [[NSMutableArray alloc]initWithObjects:
                  [UIImage imageNamed:@"azu.jpg"],
                  [UIImage imageNamed:@"まっしー.jpg"],
                  [UIImage imageNamed:@"inocchi.jpg"], nil];
}

//画面遷移する直前に呼ばれる
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Segueの名前がselectRowだったら
    if ([[segue identifier] isEqualToString:@"selectRow"]) {
        //データの受け渡しをしてます
        DetailViewController *vcntl = [segue destinationViewController];    // <- 1
        vcntl.rowNumber = [table indexPathForSelectedRow].row;    // <- 2
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -　テーブルビュー
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [nameArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifer = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    
    cell.textLabel.text = [nameArray objectAtIndex:indexPath.row];
    cell.imageView.image = [imageArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [proArray objectAtIndex:indexPath.row];
    
    return cell;
}
@end
