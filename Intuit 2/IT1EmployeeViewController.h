//
//  IT1EmployeeViewController.h
//  Intuit 2
//
//  Created by Rupert Deese on 2/12/13.
//  Copyright (c) 2013 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
@class IT1EmployeeViewController;

@protocol EmployeeVCDelegate <NSObject>
-(void) getCustTotal:(IT1EmployeeViewController *)controller;
-(void) updateTipArray:(IT1EmployeeViewController *)empVC;
@end

@interface IT1EmployeeViewController : UIViewController <MFMailComposeViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *sendDataButton;
@property (strong) IBOutlet UITextField *costField;
@property (nonatomic, strong) id <EmployeeVCDelegate> delegate;
@property NSMutableArray* tipArray;

-(IBAction) buttonPressed:(id)sender;

@end
