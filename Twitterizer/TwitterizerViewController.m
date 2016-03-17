//
//  TwitterizerViewController.m
//  Twitterizer
//
//  Created by Suleiman Younossi on 3/16/16.
//  Copyright © 2016 Suleiman Younossi. All rights reserved.
//

#import "TwitterizerViewController.h"

@interface TwitterizerViewController () < UITextViewDelegate >
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *textCount;

@end

@implementation TwitterizerViewController


//Load views and access text view delegate

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUInteger characterCount = [self.textView.text length];
    self.textCount.text = [NSString stringWithFormat:@"%lu",characterCount];
    
    self.textView.delegate = self;
    
    if ([self.textCount.text integerValue]>140) {
        self.textView.userInteractionEnabled = NO;
    }
    
    
}

//Take out vowels action button

- (IBAction)twitterize:(UIButton *)sender {
    NSString *ogString = self.textView.text;
    NSString *finalString = [NSMutableString new];
    

    
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"aeiou"];
    finalString = [[ogString componentsSeparatedByCharactersInSet:doNotWant] componentsJoinedByString:@""];
    
    self.textView.text = finalString;
    
    NSUInteger length = self.textView.text.length;
    self.textCount.text = [NSString stringWithFormat:@"%lu",length];
    
    
}
- (IBAction)hashTagButton:(UIButton *)sender {
    NSString *hashTagTextField = self.textView.text;
    NSMutableArray *arr = [[hashTagTextField componentsSeparatedByString:@" "]  mutableCopy];
    NSMutableString *tempMutString = [NSMutableString new];
    NSMutableString *tempMutString2 = [NSMutableString new];
    
    if ([hashTagTextField containsString:@"#"]) {
        NSLog(@"containsString");
    }
    NSLog(@"does not have #");
    
    for (int i = 0; i < arr.count; i++) {
        if (i % 2) {
            NSLog(@"even index");
            
            NSString *tempString = [NSString stringWithFormat:@"#%@", arr[i]];
            tempMutString = [NSMutableString stringWithFormat:@"%@", tempString];
            tempMutString2 = [NSMutableString stringWithFormat:@"%@ %@", tempMutString2, tempMutString];
        } else {
            NSLog(@"odd index");
            
            tempMutString = [NSMutableString stringWithFormat:@"%@", arr[i]];
            tempMutString2 = [NSMutableString stringWithFormat:@"%@ %@", tempMutString2, tempMutString];
        }
    }
    NSLog(@"finished and printing out final");
    
    self.textView.text = tempMutString2;
}



    


- (void)textViewDidChange:(UITextView *)textView {
    NSUInteger length = textView.text.length;
    self.textCount.text = [NSString stringWithFormat:@"%lu",length];
    
//    if ([self.textCount.text integerValue]>=140) {
//        self.textView.editable = NO;
//    }
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //NSLog([NSString stringWithFormat:@"%lu",textView.text.length + (text.length - range.length)]);
    //NSLog([NSString stringWithFormat:@"%lu",text.length]);
    
    return textView.text.length + text.length  <= 140;
}



//-(void) textViewDidChange:(UITextView *)textView {
//    int length = textView.text.length;
//    self.textCount.text = [NSString stringWithFormat:@"%i",140-length];
//    
//}
//
//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
//{
//    if([text length] == 0)
//    {
//        if([textView.text length] != 0)
//        {
//            return YES;
//        }
//    }
//    else if([[textView text] length] > 139)
//    {
//        return NO;
//    }
//    return YES;
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(NSString *)reverseString: (NSString *)oldString {
    
    NSUInteger length = oldString.length;
    NSMutableString *newString = [NSMutableString new];
    
    

    for(int i = length - 1;i >= 0; i--) {
        
        [newString appendFormat:@"%c",[oldString characterAtIndex:i]];
        
    }
    
    NSLog(@"reverseString() old string >%@<", oldString);
    NSLog(@"reverseString() new string >%@<", newString);
    return newString;

}



- (IBAction)reverseButton:(UIButton *)sender {
    
    NSArray *words = [self.textView.text componentsSeparatedByString:@" "];
    NSMutableString *newParagraph = [NSMutableString new];
    
    
    for (int i = 0; i < words.count; i++) {
        NSString *word = words[i];
        
        
        if (![word containsString:@"#"]) {
            
            word = [self reverseString:word];
            
        }
        
        [newParagraph appendString:word];
        [newParagraph appendString:@" "];
    }
    
    self.textView.text = newParagraph;
    
    
    
    
    
    
    
    
}

@end
