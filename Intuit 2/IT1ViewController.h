//
//  IT1ViewController.h
//  Intuit 2
//
//  Created by Rupert Deese on 2/10/13.
//  Copyright (c) 2013 Rupert Deese. All rights reserved.
//

#import "IT1ViewController.h"
#import <UIKit/UIKit.h>
#import "IT1EmployeeViewController.h"
#import "IT1TipViewController.h"

@class IT1ViewController;

@interface IT1ViewController : UIViewController <TipVCDelegate>
{
    bool isShowingUpsideDown;
    IT1TipViewController* tipController;
    double custTotal;
}
@property (strong) IBOutlet UILabel *idLabel;
@property (strong) IBOutlet UITextField *idField;
@property (strong) IBOutlet UIButton *nextButton;

-(IBAction) buttonPressed:(id)sender;
-(void) resetCustTotal;

@end
