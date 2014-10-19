//
//  ViewController.m
//  QR Generator
//
//  Created by Vadim Maslov on 19.10.14.
//  Copyright (c) 2014 Vadim Maslov. All rights reserved.
//

#import "ViewController.h"
#import "QRImage.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *qrImageView;

@end

@implementation ViewController

//hide keyboard by typing on screen
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (IBAction)generate:(UIButton *)sender
{
    if ([self.codeTextField.text length] == 8) {
        [self.codeTextField resignFirstResponder];
        NSString *str           = [NSString stringWithFormat:@"MAYKOR_ASSET_QR_ID_%ld_%ld",
                                   (long)[[self checkString:self.codeTextField.text] integerValue],
                                   [[self checkString:self.codeTextField.text] integerValue]*3];
        self.codeLabel.text     = str;
        QRImage *qrimage        = [[QRImage alloc] initWithString:str];
        self.qrImageView.image  = qrimage.image;
    } else {
        [[ [UIAlertView alloc] initWithTitle:@"Ошибка!"
                                     message:@"Введите восемь цифр."
                                    delegate:nil
                           cancelButtonTitle:@"Ok"
                           otherButtonTitles:nil, nil]show];
    }
}

- (IBAction)clear:(UIButton *)sender
{
    self.codeTextField.text = @"";
    self.codeLabel.text     = @"";
    self.qrImageView.image  = nil;
}

//As notice in requirements we should remove zero from beginning
-(NSString *)checkString:(NSString *)str
{
    while ([str characterAtIndex:0] == '0') {
        str = [str substringFromIndex:1];
    }
    return str;
}


@end
