//
//  PHPOXViewController.m
//  guestnumber
//
//  Created by phpox on 12-7-30.
//  Copyright (c) 2012年 phpox. All rights reserved.
//

#import "PHPOXViewController.h"

@interface PHPOXViewController ()

@end

@implementation PHPOXViewController

@synthesize myPick;
@synthesize myLabel;
@synthesize txtRes;
@synthesize lblTip;
@synthesize viewRes;

-(IBAction)calcNum:(id)sender
{
    if(txtRes.text.length > 4){
        [[[UIAlertView alloc] initWithTitle:@"提示信息" message:@"长度不能超过4位数" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
        return;
    }

    lblTip.text = @"";
    NSString *res = txtRes.text;
    NSMutableString *tip = [[NSMutableString alloc] init];
    NSMutableString *tmp = [[NSMutableString alloc] init];
    for(int i=0;i<res.length;++i)
    {
        //char c = [res characterAtIndex:i];
        NSString *c = [res substringWithRange:NSMakeRange(i, 1)];
        //[arr1 addObject:[NSNumber numberWithChar:c]];
        NSNumber *t1 = [NSNumber numberWithInteger:[c integerValue]];
        NSNumber *num = (NSNumber*)[arr objectAtIndex:i];
        if([t1 compare:num]==NSOrderedSame)
        {
            [tmp setString:@"A"];
        }
        else
        {
            for (NSNumber *num1 in arr)
            {
                if([t1 compare:num1] == NSOrderedSame)
                {
                    [tmp setString:@"B"];
                    break;
                }
                else
                {
                    [tmp setString:@"F"];
                }
            }
        }
        [tip appendString:tmp];
    }
    lblTip.text = tip;
}

-(IBAction)viewres:(id)sender
{
    [str setString:@""];
    for (NSNumber *num in arr)
    {
        [str appendFormat:@"%d",[num integerValue]];
    }
    myLabel.text = str;

}

-(void)ctArr
{
    while ([arr count] < 4) {
        int value = arc4random() % 10;
        NSNumber *myInt = [NSNumber numberWithInt:value];
        BOOL is = false;
        for(NSNumber *num in arr)
        {
            if([num compare: myInt] == NSOrderedSame){
                is = true;
                break;
            }
        }
        if (!is) {
            [arr addObject:myInt];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    str = [[NSMutableString alloc] init];
    arr = [[NSMutableArray alloc] init];
    arr1 = [[NSMutableArray alloc] init];
    
    if ([arr count] == 0) {
        [self ctArr];
    }
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMyLabel:nil];
    [self setMyPick:nil];
    [self setTxtRes:nil];
    [self setLblTip:nil];
    [self setViewRes:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
