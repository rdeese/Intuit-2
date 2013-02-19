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
@synthesize idLabel;
@synthesize idField;
@synthesize nextButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [idLabel setHidden:TRUE];
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
        //code to save idno goes here?
        [self performSegueWithIdentifier:@"segueToTip" sender:self];
        [idField setText:@""];
        [idLabel setHidden:TRUE];
    }
    else
    {
        [idLabel setHidden:FALSE];
    }
}

-(void) resetCustTotal
{
    custTotal = 0;
}

- (void)awakeFromNib
{
    isShowingUpsideDown = NO;
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueToTip"])
    {
        tipController = (IT1TipViewController *)segue.destinationViewController;
        tipController.custTotal = custTotal;
        tipController.delegate = self;
    }
}

- (void)orientationChanged:(NSNotification *)notification
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    if (deviceOrientation == UIDeviceOrientationPortraitUpsideDown &&
        !isShowingUpsideDown)
    {
        [self performSegueWithIdentifier:@"ToEmployee" sender:self];
        isShowingUpsideDown = YES;
    }
    else if (deviceOrientation == UIDeviceOrientationPortrait &&
             isShowingUpsideDown)
    {
        IT1EmployeeViewController *empView = (IT1EmployeeViewController*)self.presentedViewController;
        custTotal = [empView.costField.text doubleValue];
        empView.delegate = tipController;
        [empView.delegate getCustTotal:empView];
        [self dismissViewControllerAnimated:YES completion:nil];
        isShowingUpsideDown = NO;
    }
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
