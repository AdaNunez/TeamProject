//
//  LuckyMoneyViewController.m
//  TeamProject
//
//  Created by Orlando Gotera on 10/18/17.
//  Copyright © 2017 Orlando Gotera. All rights reserved.
//

#import "LuckyMoneyViewController.h"

#define kFirstDigit    0
#define kSecondDigit   1
#define kThirdDigit    2
#define kFourthDigit   3
#define kFifthDigit    4


@interface LuckyMoneyViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *luckyMoney;
@property (weak, nonatomic) IBOutlet UILabel *lblWinner;
@property (strong, nonatomic)NSArray *arrayFirstInteger;
@property (strong, nonatomic)NSArray *arrayLuckyBall;

@end

@implementation LuckyMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayFirstInteger = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                               @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18",
                               @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27",
                               @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36",
                               @"37", @"38", @"39", @"40", @"41", @"42", @"43", @"44", @"45", @"46", @"47"];
    
    self.arrayLuckyBall = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                            @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17"];
    for (int i=0; i<5; i++){
        if (i < 4) {
            int newValue = arc4random_uniform((uint)[self.arrayFirstInteger count]);
            
            // set the picker comopnent
            [self.luckyMoney selectRow:newValue inComponent:i animated:YES];
            [self.luckyMoney reloadComponent:i];
        } else if (i > 3) {
            int newValue = arc4random_uniform(17);
            
            // set the picker comopnent
            [self.luckyMoney selectRow:newValue inComponent:i animated:YES];
            [self.luckyMoney reloadComponent:i];
        }
    }
    
    self.lblWinner.text = @" ";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)pickRandom:(id)sender {
    for (int i=0; i<5; i++){
        if (i < 4) {
            int newValue = arc4random_uniform((uint)[self.arrayFirstInteger count]);
            
            // set the picker comopnent
            [self.luckyMoney selectRow:newValue inComponent:i animated:YES];
            [self.luckyMoney reloadComponent:i];
        } else if (i > 3) {
            int newValue = arc4random_uniform(17);
            
            // set the picker comopnent
            [self.luckyMoney selectRow:newValue inComponent:i animated:YES];
            [self.luckyMoney reloadComponent:i];
        }
        
    }
    
}
- (IBAction)checkIfWinner:(id)sender {
    NSString *one = @"3";
    NSString *two = @"5";
    NSString *three = @"7";
    NSString *four = @"9";
    NSString *five = @"11";
    NSString *winningNumbers = [[NSString alloc]initWithFormat:@"%@%@%@%@%@", one, two, three, four, five];
    NSInteger firstDigit = [self.luckyMoney selectedRowInComponent:kFirstDigit];
    NSInteger secondDigit = [self.luckyMoney selectedRowInComponent:kSecondDigit];
    NSInteger thirdDigit = [self.luckyMoney selectedRowInComponent:kThirdDigit];
    NSInteger fourthDigit = [self.luckyMoney selectedRowInComponent:kFourthDigit];
    NSInteger fifthDigit = [self.luckyMoney selectedRowInComponent:kFifthDigit];
    
    NSString *digit1 = self.arrayFirstInteger[firstDigit];
    NSString *digit2 = self.arrayFirstInteger[secondDigit];
    NSString *digit3 = self.arrayFirstInteger[thirdDigit];
    NSString *digit4 = self.arrayFirstInteger[fourthDigit];
    NSString *digit5 = self.arrayFirstInteger[fifthDigit];
    
    NSString *message = [[NSString alloc]initWithFormat:@"%@%@%@%@%@", digit1, digit2, digit3, digit4, digit5];
    
    if ([message isEqualToString:winningNumbers]) {
        self.lblWinner.text = @"WINNER!";
    } else {
        self.lblWinner.text = @"NOT A WINNER!";
    }
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    // since our picker has 2 wheels we return 2
    return 5;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(component == kFifthDigit){
        return [self.arrayLuckyBall count];
    } else {
        return [self.arrayFirstInteger count];
    }
}

-(NSString* )pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == kFirstDigit){
        return self.arrayFirstInteger[row];
    } else {
        return self.arrayFirstInteger[row];
    }
}

@end
