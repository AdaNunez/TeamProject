//
//  LottoViewController.m
//  TeamProject
//
//  Created by Orlando Gotera on 10/18/17.
//  Copyright © 2017 Orlando Gotera. All rights reserved.
//

#import "LottoViewController.h"

#define kFirstDigit    0
#define kSecondDigit   1
#define kThirdDigit    2
#define kFourthDigit   3
#define kFifthDigit    4
#define kSixthDigit    5

@interface LottoViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *lottoPicker;
@property (weak, nonatomic) IBOutlet UILabel *lblWinner;
@property (strong, nonatomic)NSArray *arrayFirstInteger;

@end

@implementation LottoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayFirstInteger = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                               @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18",
                               @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27",
                               @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36",
                               @"37", @"38", @"39", @"40", @"41", @"42", @"43", @"44", @"45",
                               @"46", @"47", @"48", @"49", @"50", @"51", @"52", @"53"];
    for (int i=0; i<6; i++){
        
        int newValue = arc4random_uniform((uint)[self.arrayFirstInteger count]);
        
        // set the picker comopnent
        [self.lottoPicker selectRow:newValue inComponent:i animated:YES];
        [self.lottoPicker reloadComponent:i];
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

    
    for (int i=0; i<6; i++){
        
        int newValue = arc4random_uniform((uint)[self.arrayFirstInteger count]);
        
        // set the picker comopnent
        [self.lottoPicker selectRow:newValue inComponent:i animated:YES];
        [self.lottoPicker reloadComponent:i];
    }
}
- (IBAction)checkIfWinner:(id)sender {
    NSString *one = @"3";
    NSString *two = @"5";
    NSString *three = @"7";
    NSString *four = @"9";
    NSString *five = @"11";
    NSString *six = @"13";
    NSString *winningNumbers = [[NSString alloc]initWithFormat:@"%@%@%@%@%@%@", one, two, three, four, five, six];
    NSInteger firstDigit = [self.lottoPicker selectedRowInComponent:kFirstDigit];
    NSInteger secondDigit = [self.lottoPicker selectedRowInComponent:kSecondDigit];
    NSInteger thirdDigit = [self.lottoPicker selectedRowInComponent:kThirdDigit];
    NSInteger fourthDigit = [self.lottoPicker selectedRowInComponent:kFourthDigit];
    NSInteger fifthDigit = [self.lottoPicker selectedRowInComponent:kFifthDigit];
    NSInteger sixthDigit = [self.lottoPicker selectedRowInComponent:kSixthDigit];

    
    NSString *digit1 = self.arrayFirstInteger[firstDigit];
    NSString *digit2 = self.arrayFirstInteger[secondDigit];
    NSString *digit3 = self.arrayFirstInteger[thirdDigit];
    NSString *digit4 = self.arrayFirstInteger[fourthDigit];
    NSString *digit5 = self.arrayFirstInteger[fifthDigit];
    NSString *digit6 = self.arrayFirstInteger[sixthDigit];
    
    NSString *message = [[NSString alloc]initWithFormat:@"%@%@%@%@%@%@", digit1, digit2, digit3, digit4, digit5, digit6];
    
    if ([message isEqualToString:winningNumbers]) {
        self.lblWinner.text = @"WINNER!";
    } else {
        self.lblWinner.text = @"NOT A WINNER!";
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    // since our picker has 2 wheels we return 2
    return 6;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(component == kFirstDigit){
        return [self.arrayFirstInteger count];
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
