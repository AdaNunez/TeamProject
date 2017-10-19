//
//  Pick5ViewController.m
//  TeamProject
//
//  Created by Orlando Gotera on 10/18/17.
//  Copyright © 2017 Orlando Gotera. All rights reserved.
//

#import "Pick5ViewController.h"

#define kFirstDigit    0
#define kSecondDigit   1
#define kThirdDigit    2
#define kFourthDigit   3
#define kFifthDigit    4

@interface Pick5ViewController ()

@property (strong, nonatomic)NSArray *arrayFirstInteger;
@property (weak, nonatomic) IBOutlet UILabel *lblWinner;
@property (weak, nonatomic) IBOutlet UIPickerView *pick5;

@end

@implementation Pick5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayFirstInteger = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"];
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

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    // since our picker has 2 wheels we return 2
    return 5;
    
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

- (IBAction)pickRandom:(id)sender {
    for (int i=0; i<5; i++){
        int newValue = arc4random_uniform((uint)[self.arrayFirstInteger count]);
        
        // set the picker comopnent
        [self.pick5 selectRow:newValue inComponent:i animated:YES];
        [self.pick5 reloadComponent:i];
    }
}
- (IBAction)checkIfWinner:(id)sender {
    NSString *one = @"3";
    NSString *two = @"5";
    NSString *three = @"6";
    NSString *four = @"5";
    NSString *five = @"4";
    NSString *winningNumbers = [[NSString alloc]initWithFormat:@"%@%@%@%@%@", one, two, three, four, five];
    NSInteger firstDigit = [self.pick5 selectedRowInComponent:kFirstDigit];
    NSInteger secondDigit = [self.pick5 selectedRowInComponent:kSecondDigit];
    NSInteger thirdDigit = [self.pick5 selectedRowInComponent:kThirdDigit];
    NSInteger fourthDigit = [self.pick5 selectedRowInComponent:kFourthDigit];
    NSInteger fifthDigit = [self.pick5 selectedRowInComponent:kFifthDigit];
    
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

@end
