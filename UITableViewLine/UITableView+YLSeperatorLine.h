//
//  UITableView+YLSeperatorLine.h
//  UITableViewLine
//
//  Created by yongliangP on 16/6/23.
//  Copyright © 2016年 yongliangP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (YLSeperatorLine)
/**
 *  @param cell      需要设置的cell
 *  @param indexPath 划线位置
 *  @param leftSpace 左右边距
 *  @param lineColor  线的颜色
 */
- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace withLineColor:(UIColor*)lineColor;

- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace;

- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace hasSectionLine:(BOOL)hasSectionLine;

@end
