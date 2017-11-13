//
//  ViewController.m
//  BillSplitter
//
//  Created by Javier Xing on 2017-11-12.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UISlider *numOfPeopleSlider;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPeopleLabel;
@property (weak, nonatomic) IBOutlet UILabel *overallPriceLabel;

@property (strong,nonatomic)NSDecimalNumber *personalAmount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)showSliderDetails:(id)sender {
    self.numberOfPeopleLabel.text = [NSString stringWithFormat:@"%d", (int)self.numOfPeopleSlider.value];
}


- (IBAction)calculateSplitAmount:(id)sender {
    NSDecimalNumber * totalBill = [[NSDecimalNumber alloc]initWithString:self.billAmountTextField.text];
    self.personalAmount = [[NSDecimalNumber alloc]initWithFloat:[totalBill floatValue]/(int)self.numOfPeopleSlider.value];
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc]init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    self.overallPriceLabel.text = [NSString stringWithFormat:@"Your bill comes to: %@", [currencyFormatter stringFromNumber:self.personalAmount]];

}


@end
