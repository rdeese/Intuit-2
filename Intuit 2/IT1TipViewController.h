//
//  IT1TipViewController.h
//  Intuit 2
//
//  Created by Rupert Deese on 2/10/13.
//  Copyright (c) 2013 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IT1TipViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate> {
    NSInteger centsPick;
    NSInteger dollarPick;
}
@property (nonatomic,strong) NSArray *pickerData1;
@property (nonatomic,strong) NSArray *pickerData2;
@property (strong) IBOutlet UIButton *tipButton;
@property (strong) IBOutlet UIPickerView *tipPicker;

-(IBAction) buttonPressed:(id)sender;

@end
