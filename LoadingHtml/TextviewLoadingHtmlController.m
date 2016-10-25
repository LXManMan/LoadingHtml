
//
//  TextviewLoadingHtmlController.m
//  LoadingHtml
//
//  Created by chuanglong02 on 16/10/25.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "TextviewLoadingHtmlController.h"

@interface TextviewLoadingHtmlController ()
@property(nonatomic,strong)UIScrollView *scrollview;
@property(nonatomic,strong)UITextView *textview;

@end

@implementation TextviewLoadingHtmlController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass([self class]);

    [self.view addSubview:self.scrollview];
    [self.scrollview addSubview:self.textview];
    self.textview.attributedText = [self attributedStringWithHTMLString:LocalHTMLString];
    CGFloat height =   [self.textview.attributedText boundingRectWithSize:CGSizeMake(Device_Width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
    
    self.textview.height = height;
    self.textview.contentSize = CGSizeMake(Device_Width, height);
    self.scrollview.contentSize = CGSizeMake(Device_Width, height);
    

}
- (NSAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString
{
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
                               NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
    
    NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
    
    return [[NSAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
}
-(UITextView *)textview
{
    if (!_textview) {
        _textview =[[UITextView alloc]initWithFrame:CGRectMake(0, 0, Device_Width, 40)];
        _textview.backgroundColor =[UIColor redColor];
    }
    return _textview;
}
-(UIScrollView *)scrollview
{
    if (!_scrollview) {
        _scrollview =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Device_Width, Device_Height)];
        _scrollview.showsHorizontalScrollIndicator = NO;
    }
    return _scrollview;
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

@end
