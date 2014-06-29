//
//  DetailViewController.m
//  TestHomeworks
//
//  Created by Inocchi on 2014/06/15.
//  Copyright (c) 2014年 Inocchi. All rights reserved.
//

#import "DetailViewController.h"
#import <Parse/Parse.h>


@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"aaa%lu",_rowNumber);
    label.text = [NSString stringWithFormat:@"aaa%d",_rowNumber];
    
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

@end
