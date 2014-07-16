//
//  PostViewController.m
//  TestHomeworks
//
//  Created by Inocchi on 2014/07/13.
//  Copyright (c) 2014年 Inocchi. All rights reserved.
//

#import "PostViewController.h"
#import <Parse/Parse.h>

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
    
    UITextField *textField = [[UITextField alloc ]init] ;
    
    self.naiyou.delegate = self;
    self.naiyou.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self;
    textField.placeholder = @"ここに内容を入力してkudasai";
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
    Q[@"text"] = _naiyou.text;
    
    [Q saveInBackground];
}

- (BOOL)textFieldShouldReturn:(UITextView *)textView{
    // キーボードを消す
    [self.naiyou resignFirstResponder] ;
    return YES;
}

@end
