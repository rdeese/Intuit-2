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
@synthesize tipArray;
@synthesize delegate;

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
    tipArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPressed:(id)sender
{
    [self.delegate updateTipArray:self];
    if ([MFMailComposeViewController canSendMail])
    {
        NSDate *now = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"America/Los_Angeles"]];

        MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
        [mailController setSubject:[NSString stringWithFormat:@"%@%@",@"Tipping Data ",[formatter stringFromDate:now]]];
        
        NSString *dataString = [tipArray componentsJoinedByString:@"\n"];
        [mailController setMessageBody:dataString isHTML:NO];
        
        [mailController setMailComposeDelegate:self];
        [self presentViewController:mailController animated:YES completion:NULL];
        [tipArray removeAllObjects];
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error
{
    
    if (result == MFMailComposeResultSent) {
        
        NSLog(@"It's away!");
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
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
