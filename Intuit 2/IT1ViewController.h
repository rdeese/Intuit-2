//
//  IT1ViewController.h
//  Intuit 2
//
//  Created by Rupert Deese on 2/10/13.
//  Copyright (c) 2013 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IT1ViewController : UIViewController
@property (strong) IBOutlet UITextField *idField;
@property (strong) IBOutlet UIButton *nextButton;

-(IBAction) buttonPressed:(id)sender;

@end
