//
//  ViewController.m
//  LoadingHtml
//
//  Created by chuanglong02 on 16/10/25.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "ViewController.h"
#import "LabelLoadingHtmlController.h"
#import "TextviewLoadingHtmlController.h"
#import "WebviewLoadingHtmlController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIFont *font =[UIFont systemFontOfSize:16.0];
    UIColor *titleColor =[UIColor blackColor];
    
    
    LxButton *buttonLable =[LxButton LXButtonWithTitle:@"Label加载HTML" titleFont:font Image:nil backgroundImage:nil backgroundColor:LBRandomColor titleColor:titleColor frame:CGRectMake(20, 64, 200, 40)];
    
    [self.view addSubview:buttonLable];
    LxButton *buttonTextview =[LxButton LXButtonWithTitle:@"Textview加载HTML" titleFont:font Image:nil backgroundImage:nil backgroundColor:LBRandomColor titleColor:titleColor frame:CGRectMake(20, 200, 200, 40)];
    
    [self.view addSubview:buttonTextview];
    LxButton *buttonWebview =[LxButton LXButtonWithTitle:@"Webview加载HTML" titleFont:font Image:nil backgroundImage:nil backgroundColor:LBRandomColor titleColor:titleColor frame:CGRectMake(20, 300, 200, 40)];
    
    [self.view addSubview:buttonWebview];
    
    
    
    __weak ViewController *weakSelf = self;
    [buttonLable addClickBlock:^(UIButton *button) {
        [weakSelf.navigationController pushViewController:[[LabelLoadingHtmlController alloc]init] animated:YES];
        
    }];
    [buttonTextview addClickBlock:^(UIButton *button) {
        [weakSelf.navigationController pushViewController:[[TextviewLoadingHtmlController alloc]init] animated:YES];
        
    }];
    [buttonWebview addClickBlock:^(UIButton *button) {
        [weakSelf.navigationController pushViewController:[[WebviewLoadingHtmlController alloc]init] animated:YES];
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
