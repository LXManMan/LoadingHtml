//
//  WebviewCell.m
//  LoadingHtml
//
//  Created by chuanglong02 on 16/10/25.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "WebviewCell.h"
@interface WebviewCell()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webview;
@end
static CGFloat staticheight = 0;
@implementation WebviewCell
+(CGFloat)cellHeight
{
    return staticheight;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle: style reuseIdentifier:reuseIdentifier]) {
        
//        self.webview.scrollView.backgroundColor =[UIColor redColor];
        [self.contentView addSubview:self.webview];
    }
    return self;
    
}
-(void)setHtmlString:(NSString *)htmlString
{
    _htmlString = htmlString;
    
    self.webview.delegate = self;
    [self.webview loadHTMLString:htmlString baseURL:nil];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
     CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue]+20 ;
    self.webview.frame = CGRectMake(0, 0, Device_Width, height);
     self.webview.hidden = NO;
    if (staticheight != height+1) {
        
        staticheight = height+1;
        
        if (staticheight > 0) {
            
            
           
            if (_reloadBlock) {
                _reloadBlock();
            }
        }
    }
}
-(UIWebView *)webview
{
    if (!_webview) {
        _webview =[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, Device_Width, 0)];
        _webview.userInteractionEnabled = NO;
        _webview.hidden = YES;
    }
    return _webview;
}
@end
