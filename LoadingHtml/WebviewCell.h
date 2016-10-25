//
//  WebviewCell.h
//  LoadingHtml
//
//  Created by chuanglong02 on 16/10/25.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ReloadBlock)();
@interface WebviewCell : UITableViewCell
@property(nonatomic,copy)NSString *htmlString;
@property(nonatomic,copy)ReloadBlock reloadBlock;
+(CGFloat)cellHeight;

@end
