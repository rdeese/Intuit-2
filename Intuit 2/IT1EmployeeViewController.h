//
//  IT1EmployeeViewController.h
//  Intuit 2
//
//  Created by Rupert Deese on 2/12/13.
//  Copyright (c) 2013 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IT1EmployeeViewController;

@protocol EmployeeVCDelegate <NSObject>
-(void) getCustTotal:(IT1EmployeeViewController *)controller;
@end

@interface IT1EmployeeViewController : UIViewController
@property (strong) IBOutlet UITextField *costField;
@property (nonatomic, weak) id <EmployeeVCDelegate> delegate;

@end
