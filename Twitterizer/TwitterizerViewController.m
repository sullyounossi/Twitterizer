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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUInteger characterCount = [self.textView.text length];
    self.textCount.text = [NSString stringWithFormat:@"%lu",characterCount];
    
    self.textView.delegate = self;
    
    if ([self.textCount.text integerValue]>140) {
        self.textView.userInteractionEnabled = NO;
    }
    
    
}

- (IBAction)twitterize:(UIButton *)sender {
    NSString *ogString = self.textView.text;
    NSString *finalString = [NSMutableString new];
    
// NSUInteger length = ogString.length;
    
    
//    for (int i = 0; i < length; i++) {
//        [ogString characterAtIndex:i];
//        if (![[NSString stringWithFormat:@"%c", [ogString characterAtIndex:i]]  isEqualToString:@"a"]) {
//            [finalString appendString:[NSString stringWithFormat:@"%c", [ogString characterAtIndex:i]]];
//            
//        }
//
//    }
    
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"aeiou"];
    finalString = [[ogString componentsSeparatedByCharactersInSet:doNotWant] componentsJoinedByString:@""];
    
    self.textView.text = finalString;
    
    NSUInteger length = self.textView.text.length;
    self.textCount.text = [NSString stringWithFormat:@"%lu",length];
    
    
}

- (void) textViewDidChange:(UITextView *)textView {
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

@end
