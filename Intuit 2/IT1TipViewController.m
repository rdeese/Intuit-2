//
//  IT1TipViewController.m
//  Intuit 2
//
//  Created by Rupert Deese on 2/10/13.
//  Copyright (c) 2013 Rupert Deese. All rights reserved.
//

#import "IT1TipViewController.h"
#import "IT1ViewController.h"

@interface IT1TipViewController ()

@end

@implementation IT1TipViewController
@synthesize pickerData1;
@synthesize pickerData2;
@synthesize tipButton;
@synthesize tipPicker;
@synthesize custTotal;
@synthesize totalLabel;

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
    pickerData1 = [[NSArray alloc] initWithObjects:@"$4",@"$3",@"$2",@"$1",@"$0", nil];
    pickerData2 = [[NSArray alloc] initWithObjects:/*@".00",*/@".75",@".50",@".25",@".00"/*,
                   @".75",@".50",@".25",@".00", @".75",@".50",@".25",@".00",
                   @".75",@".50",@".25",@".00", @".75",@".50",@".25",@".00",
                   @".75",@".50",@".25",@".00", @".75",@".50",@".25",@".00",
                   @".75",@".50",@".25",@".00", @".75",@".50",@".25",@".00",
                   @".75",@".50",@".25",@".00", @".75",@".50",@".25",@".00"*/, nil];
    tipPicker.delegate = self;
    tipPicker.dataSource = self;
    dollarPick = [pickerData1 count]-1;
    [tipPicker selectRow:(dollarPick) inComponent:0 animated:NO];
    centsPick = [pickerData2 count]-1;
    [tipPicker selectRow:centsPick inComponent:1 animated:NO];
    [self updateTotalWTip];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) updateTotalWTip
{
    totalWTip = custTotal + [[pickerData2 objectAtIndex:centsPick] doubleValue] +
                4-dollarPick;
    NSString* temp = [[NSString alloc] initWithFormat:@"%@%f",@"$",totalWTip];
    NSRange displayRange;
    if (totalWTip >= 10) {
        displayRange = NSMakeRange(0, 6);
    }
    else {
        displayRange = NSMakeRange(0, 5);
    }
    totalLabel.text = [temp substringWithRange:displayRange];
}

-(IBAction) buttonPressed:(id)sender
{
    custTotal = 0;
    dollarPick = [pickerData1 count]-1;
    [tipPicker selectRow:(dollarPick) inComponent:0 animated:NO];
    centsPick = [pickerData2 count]-1;
    [tipPicker selectRow:centsPick inComponent:1 animated:NO];
    [self.delegate resetCustTotal];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) getCustTotal:(IT1EmployeeViewController *)controller
{
    custTotal = [controller.costField.text doubleValue];
    [self updateTotalWTip];
}

//DELEGATE
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    if (component == 1)
    {
        /*
        NSInteger dollarChange = 0;
        if (abs(row - centsPick)/4 > 0)
        {
            NSLog(@"first way");
            dollarChange = -(centsPick-row)/4;
        }
        if (row%4 < centsPick%4)
        {
            if (row < centsPick)
                dollarChange -= 1;
            else
                dollarChange += 1;
        }
        
        if (([pickerView selectedRowInComponent:0]+dollarChange >= 0) &&
            ([pickerView selectedRowInComponent:0]+dollarChange < [pickerData1 count]))
        {
            [pickerView selectRow:[pickerView selectedRowInComponent:0]+dollarChange
                  inComponent:0 animated:YES];
        }
        
        dollarChange = 0;
         */
        [pickerView selectRow: 5*4+(row%4)
                  inComponent:1 animated:NO];
    }
    dollarPick = [pickerView selectedRowInComponent:0];
    centsPick = [pickerView selectedRowInComponent:1];
    [self updateTotalWTip];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView
    rowHeightForComponent:(NSInteger)component
{
    return 30;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (component == 0)
        return [pickerData1 objectAtIndex:row];
    else
       return [pickerData2 objectAtIndex:row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component
{
    if (component == 0)
        return 100;
    else
        return 150;
}

//DATA SOURCE
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
    numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
        return [pickerData1 count];
    else
        return [pickerData2 count];
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
