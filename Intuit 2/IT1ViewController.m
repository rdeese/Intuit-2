//
//  IT1ViewController.m
//  Intuit 2
//
//  Created by Rupert Deese on 2/10/13.
//  Copyright (c) 2013 Rupert Deese. All rights reserved.
//

#import "IT1ViewController.h"

@interface IT1ViewController ()

@end

@implementation IT1ViewController
@synthesize idField;
@synthesize nextButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) buttonPressed:(id)sender
{
    if ([idField.text length] == 8)
    {
        NSLog(@"Score!");
        //code to save idno goes here?
        [idField setText:@""];
        [self performSegueWithIdentifier:@"segueToTip" sender:self];
    }
}

@end
