//
//  Pick2ViewController.m
//  TeamProject
//
//  Created by Orlando Gotera on 10/17/17.
//  Copyright © 2017 Orlando Gotera. All rights reserved.
//

#import "Pick2ViewController.h"
//
#define kFirstDigit    0
#define kSecondDigit   1

@interface Pick2ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblWinner;

@property (weak, nonatomic) IBOutlet UIPickerView *pick2;

//array
@property (strong, nonatomic)NSArray *arrayFirstInteger;
@property (strong, nonatomic)NSString *winningNumbers;

@end

@implementation Pick2ViewController

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
    return 2;
    
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

//selects random numbers
- (IBAction)pickRandom:(id)sender {
    for (int i=0; i<2; i++){
        int newValue = arc4random_uniform((uint)[self.arrayFirstInteger count]);
        
        // set the picker comopnent
        [self.pick2 selectRow:newValue inComponent:i animated:YES];
        [self.pick2 reloadComponent:i];
        
    }
}

//checks if user guessed right
- (IBAction)checkIfWinner:(id)sender {
    NSString *one = @"3";
    NSString *two = @"5";
    NSString *winningNumbers = [[NSString alloc]initWithFormat:@"%@%@", one, two];
    NSInteger firstDigit = [self.pick2 selectedRowInComponent:kFirstDigit];
    NSInteger secondDigit = [self.pick2 selectedRowInComponent:kSecondDigit];
    
    NSString *digit1 = self.arrayFirstInteger[firstDigit];
    NSString *digit2 = self.arrayFirstInteger[secondDigit];

    NSString *message = [[NSString alloc]initWithFormat:@"%@%@", digit1, digit2];
    
    if ([message isEqualToString:winningNumbers]) {
        self.lblWinner.text = @"WINNER!";
    } else {
        self.lblWinner.text = @"NOT A WINNER!";
    }
    
    
}


@end
