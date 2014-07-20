//
//  PostViewController.m
//  TestHomeworks
//
//  Created by Inocchi on 2014/07/13.
//  Copyright (c) 2014年 Inocchi. All rights reserved.
//

#import "PostViewController.h"
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>

@interface PostViewController ()

@end

@implementation PostViewController

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
    
   // UITextField *textField = [[UITextField alloc ]init] ;
    
    naiyou.delegate = self;
    naiyou.returnKeyType = UIReturnKeyDone;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)question:(id)sender{
    NSLog(@"書き込みします");
    //書き込みしてます。
    PFObject *Q = [PFObject objectWithClassName:@"Q"];
    Q[@"image"] = @"az.jpg";
    Q[@"name"] = username1.text;
    Q[@"text"] = naiyou.text;
    
    [Q saveInBackground];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    // キーボードを消す
    [naiyou resignFirstResponder] ;
    return YES;
}

@end
