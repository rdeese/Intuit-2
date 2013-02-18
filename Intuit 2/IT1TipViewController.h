//
//  IT1TipViewController.h
//  Intuit 2
//
//  Created by Rupert Deese on 2/10/13.
//  Copyright (c) 2013 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IT1EmployeeViewController.h"

@interface IT1TipViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate, EmployeeVCDelegate>
{
    NSInteger centsPick;
    NSInteger dollarPick;
    double totalWTip;
}

@property (nonatomic,strong) NSArray *pickerData1;
@property (nonatomic,strong) NSArray *pickerData2;
@property (strong) IBOutlet UIButton *tipButton;
@property (strong) IBOutlet UIPickerView *tipPicker;
@property (strong) IBOutlet UILabel *totalLabel;
@property double custTotal;

-(IBAction) buttonPressed:(id)sender;
-(void) updateTotalWTip;

@end
