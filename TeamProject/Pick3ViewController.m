//
//  Pick3ViewController.m
//  TeamProject
//
//  Created by Orlando Gotera on 10/18/17.
//  Copyright © 2017 Orlando Gotera. All rights reserved.
//

#import "Pick3ViewController.h"

#define kFirstDigit    0
#define kSecondDigit   1
#define kThirdDigit    2

@interface Pick3ViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *pick3;
@property (strong, nonatomic)NSArray *arrayFirstInteger;
@property (weak, nonatomic) IBOutlet UILabel *lblWinner;

@end

@implementation Pick3ViewController

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
- (IBAction)pickRandom:(id)sender {
    for (int i=0; i<3; i++){
        int newValue = arc4random_uniform((uint)[self.arrayFirstInteger count]);
        
        // set the picker comopnent
        [self.pick3 selectRow:newValue inComponent:i animated:YES];
        [self.pick3 reloadComponent:i];
    }
}
- (IBAction)checkIfWinner:(id)sender {
    NSString *one = @"3";
    NSString *two = @"5";
    NSString *three = @"6";
    NSString *winningNumbers = [[NSString alloc]initWithFormat:@"%@%@%@", one, two, three];
    NSInteger firstDigit = [self.pick3 selectedRowInComponent:kFirstDigit];
    NSInteger secondDigit = [self.pick3 selectedRowInComponent:kSecondDigit];
    NSInteger thirdDigit = [self.pick3 selectedRowInComponent:kThirdDigit];
    
    NSString *digit1 = self.arrayFirstInteger[firstDigit];
    NSString *digit2 = self.arrayFirstInteger[secondDigit];
    NSString *digit3 = self.arrayFirstInteger[thirdDigit];
    
    NSString *message = [[NSString alloc]initWithFormat:@"%@%@%@", digit1, digit2, digit3];
    
    if ([message isEqualToString:winningNumbers]) {
        self.lblWinner.text = @"WINNER!";
    } else {
        self.lblWinner.text = @"NOT A WINNER!";
    }
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    // since our picker has 2 wheels we return 2
    return 3;
    
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
   
    
