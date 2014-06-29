//
//  AnswerViewController.h
//  TestHomeworks
//
//  Created by Inocchi on 2014/06/28.
//  Copyright (c) 2014年 Inocchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIGestureRecognizerDelegate>
{
    IBOutlet UITableView *table;
    
    NSMutableArray *nameArray;
    NSMutableArray *imageArray;
    NSMutableArray *proArray;
    
    IBOutlet UITextField *name1;
    IBOutlet UITextField *name2;
    IBOutlet UILabel *name3;
    IBOutlet UILabel *pass;
    
    NSMutableArray *userArray;

}

@end
