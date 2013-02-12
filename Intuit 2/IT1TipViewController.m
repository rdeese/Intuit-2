//
//  IT1TipViewController.m
//  Intuit 2
//
//  Created by Rupert Deese on 2/10/13.
//  Copyright (c) 2013 Rupert Deese. All rights reserved.
//

#import "IT1TipViewController.h"

@interface IT1TipViewController ()

@end

@implementation IT1TipViewController
@synthesize pickerData1;
@synthesize pickerData2;
@synthesize tipButton;
@synthesize tipPicker;

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
    pickerData2 = [[NSArray alloc] initWithObjects:@".00",@".75",@".50",@".25",@".00",
                   @".75",@".50",@".25",@".00", @".75",@".50",@".25",@".00",
                   @".75",@".50",@".25",@".00", @".75",@".50",@".25",@".00",
                   @".75",@".50",@".25",@".00", @".75",@".50",@".25",@".00",
                   @".75",@".50",@".25",@".00", @".75",@".50",@".25",@".00",
                   @".75",@".50",@".25",@".00", @".75",@".50",@".25",@".00", nil];
    tipPicker.delegate = self;
    tipPicker.dataSource = self;
    dollarPick = [pickerData1 count]-1;
    [tipPicker selectRow:(dollarPick) inComponent:0 animated:NO];
    centsPick = (4*5);
    [tipPicker selectRow:centsPick inComponent:1 animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) buttonPressed:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//DELEGATE
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    if (component == 1)
    {
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
        [pickerView selectRow: 5*4+(row%4)
                  inComponent:1 animated:NO];
        dollarPick = [pickerView selectedRowInComponent:0];
        centsPick = [pickerView selectedRowInComponent:1];
    }
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

@end
