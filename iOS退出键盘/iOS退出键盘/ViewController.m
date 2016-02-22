//
//  ViewController.m
//  iOS退出键盘
//
//  Created by YNL on 16/2/22.
//  Copyright © 2016年 com.yangninglong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //指定textFiled文本框的代理
    self.textField.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//退出键盘方式第一种
//采用UITextFieldDelegate代理的方式，调用textFieldShouldReturn方法实现键盘退出（键盘的return键）
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.textField) {
        [textField resignFirstResponder];
    }
    return YES;
}

//退出键盘方式第二种  采用键盘的done方式实现
- (IBAction)doneClick:(id)sender {
    [sender resignFirstResponder];
}


//退出键盘方式第三种方法，通过轻击键盘之外的空白区域关闭虚拟键盘。
//1.拖入手势
//2.对手势进行定义方法 dismissKeyboard（可针对过个输入框）
- (IBAction)dismissKeyboard:(id)sender {
    NSArray *subviews = [self.view subviews];
    for (id objInput in subviews) {
        if ([objInput isKindOfClass:[UITextField class]]) {
            UITextField *theTextField = objInput;
            if ([objInput isFirstResponder]) {
                [theTextField resignFirstResponder];
            }
        }
    }
}

//退出键盘方式第四种方法，通过轻击键盘之外的空白区域关闭虚拟键盘。
//1 将单前view继承自UIButton 或所有的ui底层先放一个全屏的button
//2 实现大button的touch down事件
- (IBAction)backgroundTap:(id)sender {
    NSLog(@"click the backgroundTap button");
    NSArray *subviews = [self.view subviews];
    for (id objInput in subviews) {
        if ([objInput isKindOfClass:[UITextField class]]) {
            UITextField *theTextField = objInput;
            if ([objInput isFirstResponder]) {
                [theTextField resignFirstResponder];
            }
        }
    }
}


//退出键盘方式第五种方法，使用endEditing方法。
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
    NSLog(@"touchesBegan button is clicked");
}



@end
