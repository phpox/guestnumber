//
//  PHPOXViewController.h
//  guestnumber
//
//  Created by phpox on 12-7-30.
//  Copyright (c) 2012年 phpox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PHPOXViewController : UIViewController
{
    NSMutableString *str;
    NSMutableArray *arr;
    NSMutableArray *arr1;
}
@property (weak, nonatomic) IBOutlet UIPickerView *myPick;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UITextField *txtRes;
@property (weak, nonatomic) IBOutlet UILabel *lblTip;
@property (weak, nonatomic) IBOutlet UIButton *viewRes;

@end
