//
//  AnswerViewController.m
//  TestHomeworks
//
//  Created by Inocchi on 2014/06/28.
//  Copyright (c) 2014年 Inocchi. All rights reserved.
//

#import "AnswerViewController.h"
#import <Parse/Parse.h>

@interface AnswerViewController ()

@end

@implementation AnswerViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    table.delegate = self;
    table.dataSource = self;
    
    userArray = [[NSMutableArray alloc] init];
    
    
    nameArray = [[NSMutableArray alloc]initWithObjects:
                 @"az",
                 @"inocchi",
                 @"massy", nil];
    
    imageArray = [[NSMutableArray alloc]initWithObjects:
                  [UIImage imageNamed:@"azu.jpg"],
                  [UIImage imageNamed:@"まっしー.jpg"],
                  [UIImage imageNamed:@"inocchi.jpg"], nil];
    
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // データの呼び出しに成功!
            
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            //TestObjectに入ってるデータを表示する
            for (PFObject *object in objects) {
                NSLog(@"id=%@", object.objectId);
                NSLog(@"username=%@", object[@"username"]);
                [userArray addObject:object[@"username"]];
                [table reloadData];
            }
        } else {
            // データの呼び出しに失敗
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        } }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -　テーブルビュー
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [userArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifer = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    
    cell.textLabel.text = [userArray objectAtIndex:indexPath.row];
    // cell.imageView.image = [imageArray objectAtIndex:indexPath.row];
    //cell.detailTextLabel.text = [proArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(IBAction)save{
    //書き込みしてます。
    PFObject *User = [PFObject objectWithClassName:@"User"];
    User[@"username"] = name1.text;
    User[@"password"] = name2.text;
    
    [User saveInBackground];
}

-(IBAction)load{
    
    //Userに保存されているデータを全部持ってくる
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // データの呼び出しに成功!
            //呼び出したデータは、objects
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            //TestObjectに入ってるデータを表示する
            //Objectsのデータをひとつづつ呼び出す
            for (PFObject *object in objects) {
                name3.text =object[@"username"];
                NSLog(@"%@", object.objectId);
                NSLog(@"%@", object[@"username"]);
            }
        } else {
            // データの呼び出しに失敗
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        } }];
}

-(IBAction)saveparse:(id)sender{
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // データの呼び出しに成功!
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            //TestObjectに入ってるデータを表示する
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
                NSLog(@"%@", object[@"username"]);
            }
        } else {
            // データの呼び出しに失敗
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        } }];
}
-(IBAction)loadParse:(id)sender{
    //読み込み
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    //[query whereKey:@"password" equalTo:@"test"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@ username=%@", object.objectId,object[@"username"]);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

@end

