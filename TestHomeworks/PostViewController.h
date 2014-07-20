//
//  PostViewController.h
//  TestHomeworks
//
//  Created by Inocchi on 2014/07/13.
//  Copyright (c) 2014年 Inocchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>

@interface PostViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *username1;
    IBOutlet UITextField *naiyou;

}

//@property (weak,nonatomic) IBOutlet UITextView *naiyou;


@end
