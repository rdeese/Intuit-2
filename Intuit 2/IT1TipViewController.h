//
//  IT1TipViewController.h
//  Intuit 2
//
//  Created by Rupert Deese on 2/10/13.
//  Copyright (c) 2013 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IT1EmployeeViewController.h"

@class IT1TipViewController;
@protocol TipVCDelegate <NSObject>

-(void)resetCustTotal;
-(void)saveLocalData:(IT1TipViewController*) controller;

@end

@interface IT1TipViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate, EmployeeVCDelegate>
{
    NSInteger centsPick;
    NSInteger dollarPick;
    double tip;
    double totalWTip;
}

@property (nonatomic,strong) NSArray *pickerData1;
@property (nonatomic,strong) NSArray *pickerData2;
@property (strong) IBOutlet UIButton *tipButton;
@property (strong) IBOutlet UIPickerView *tipPicker;
@property (strong) IBOutlet UILabel *totalLabel;
@property (nonatomic, strong) id <TipVCDelegate> delegate;
@property double custTotal;
@property (strong) NSMutableArray* localArray;

-(IBAction) buttonPressed:(id)sender;
-(void) updateTotalWTip;
-(void)updateTipArray:(IT1EmployeeViewController *)empVC;


@end
