//
//  IT1EmployeeViewController.m
//  Intuit 2
//
//  Created by Rupert Deese on 2/12/13.
//  Copyright (c) 2013 Rupert Deese. All rights reserved.
//

#import "IT1EmployeeViewController.h"

@interface IT1EmployeeViewController ()

@end

@implementation IT1EmployeeViewController
@synthesize costField;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)orientationChanged:(NSNotification *)notification
{
    
}

//ROTATION
-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

@end
