//
//  UITableView+YLSeperatorLine.m
//  UITableViewLine
//
//  Created by yongliangP on 16/6/23.
//  Copyright © 2016年 yongliangP. All rights reserved.
//

#import "UITableView+YLSeperatorLine.h"
#import "UIColor+HexString.h"
#import <objc/runtime.h>

#define KWindowWidth [UIScreen mainScreen].bounds.size.width

NSString const *TableView_lineColorKey = @"TableView_lineColorKey";

@implementation UITableView (YLSeperatorLine)

#if 0
-(UIColor *)lineColor
{
    
    return objc_getAssociatedObject(self, &TableView_lineColorKey);
}


-(void)setLineColor:(UIColor *)lineColor
{
    
    objc_setAssociatedObject(self, &TableView_lineColorKey, lineColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

#endif

- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace hasSectionLine:(BOOL)hasSectionLine
{
        
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    CGRect cellbounds = cell.bounds;
    
    cellbounds.size.width = KWindowWidth;
    
    cell.bounds = cellbounds;
    
    CGRect bounds = CGRectInset(cell.bounds, 0, 0);
    
    CGPathAddRect(pathRef, nil, bounds);
    
    layer.path = pathRef;
    
    CFRelease(pathRef);
    if (cell.backgroundColor)
    {
        layer.fillColor = cell.backgroundColor.CGColor;//layer的填充色用cell原本的颜色
    }else if (cell.backgroundView && cell.backgroundView.backgroundColor)
    {
        layer.fillColor = cell.backgroundView.backgroundColor.CGColor;
    }else
    {
        layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
    }
    
    CGColorRef lineColor = [UIColor colorWithHexString:@"0xdddddd"].CGColor;
    
    CGColorRef sectionLineColor = lineColor;
    
    if (indexPath.row == 0 && indexPath.row == [self numberOfRowsInSection:indexPath.section]-1)
    {
        //只有一个cell。加上长线&下长线
        if (hasSectionLine)
        {
            [self layer:layer addLineUp:YES andLong:YES andColor:sectionLineColor andBounds:bounds withLeftSpace:leftSpace];
            [self layer:layer addLineUp:NO andLong:YES andColor:sectionLineColor andBounds:bounds withLeftSpace:leftSpace];
        }
    } else if (indexPath.row == 0)
    {
        //第一个cell。加上长线&下短线
        if (hasSectionLine)
        {
            [self layer:layer addLineUp:YES andLong:YES andColor:sectionLineColor andBounds:bounds withLeftSpace:leftSpace];
        }
        [self layer:layer addLineUp:NO andLong:NO andColor:lineColor andBounds:bounds withLeftSpace:leftSpace];
    } else if (indexPath.row == [self numberOfRowsInSection:indexPath.section]-1)
    {
        //最后一个cell。加下长线
        if (hasSectionLine)
        {
            [self layer:layer addLineUp:NO andLong:YES andColor:sectionLineColor andBounds:bounds withLeftSpace:leftSpace];
        }
    } else
    {
        //中间的cell。只加下短线
        [self layer:layer addLineUp:NO andLong:NO andColor:lineColor andBounds:bounds withLeftSpace:leftSpace];
    }
    UIView *testView = [[UIView alloc] initWithFrame:bounds];
    [testView.layer insertSublayer:layer atIndex:0];
    cell.backgroundView = testView;
}
- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace
{
    [self addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:leftSpace hasSectionLine:YES];
}



- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace withLineColor:(UIColor*)lineColor
{
    [self addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:leftSpace hasSectionLine:YES withLineColor:lineColor];
}


- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace hasSectionLine:(BOOL)hasSectionLine withLineColor:(UIColor*)lineColor
{
    
    NSLog(@"%ld---%ld",cell.backgroundView.subviews.count,cell.backgroundView.layer.sublayers.count);
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    CGRect cellbounds = cell.bounds;
    
    cellbounds.size.width = KWindowWidth;
    
    cell.bounds = cellbounds;
    
    CGRect bounds = CGRectInset(cell.bounds, 0, 0);
    
    CGPathAddRect(pathRef, nil, bounds);
    
    layer.path = pathRef;
    
    CFRelease(pathRef);
    
    if (cell.backgroundColor)
    {
        layer.fillColor = cell.backgroundColor.CGColor;//layer的填充色用cell原本的颜色
    }else if (cell.backgroundView && cell.backgroundView.backgroundColor)
    {
        layer.fillColor = cell.backgroundView.backgroundColor.CGColor;
    }else
    {
        layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
    }
    
    CGColorRef sectionLineColor = lineColor.CGColor;
    
    if (indexPath.row == 0 && indexPath.row == [self numberOfRowsInSection:indexPath.section]-1)
    {
        //只有一个cell。加上长线&下长线
        if (hasSectionLine)
        {
            [self layer:layer addLineUp:YES andLong:YES andColor:sectionLineColor andBounds:bounds withLeftSpace:leftSpace];
            [self layer:layer addLineUp:NO andLong:NO andColor:sectionLineColor andBounds:bounds withLeftSpace:leftSpace];
        }
    } else if (indexPath.row == 0)
    {
        //第一个cell。加上长线&下短线
        if (hasSectionLine)
        {
            [self layer:layer addLineUp:YES andLong:NO andColor:sectionLineColor andBounds:bounds withLeftSpace:leftSpace];
        }
        [self layer:layer addLineUp:NO andLong:NO andColor:sectionLineColor andBounds:bounds withLeftSpace:leftSpace];
    } else if (indexPath.row == [self numberOfRowsInSection:indexPath.section]-1)
    {
        //最后一个cell。加下长线
        if (hasSectionLine)
        {
            [self layer:layer addLineUp:NO andLong:NO andColor:sectionLineColor andBounds:bounds withLeftSpace:leftSpace];
        }
    } else
    {
        //中间的cell。只加下短线
        [self layer:layer addLineUp:NO andLong:NO andColor:sectionLineColor andBounds:bounds withLeftSpace:leftSpace];
    }
    
    UIView *testView = [[UIView alloc] initWithFrame:bounds];
    
    [testView.layer insertSublayer:layer atIndex:0];
    
    cell.backgroundView = testView;
    
}

- (void)layer:(CALayer *)layer addLineUp:(BOOL)isUp andLong:(BOOL)isLong andColor:(CGColorRef)color andBounds:(CGRect)bounds withLeftSpace:(CGFloat)leftSpace{
    
    CALayer *lineLayer = [[CALayer alloc] init];
    CGFloat lineHeight = (1.0f / [UIScreen mainScreen].scale);
    CGFloat left, top;
    if (isUp)
    {
        top = 0;
    }else
    {
        top = bounds.size.height-lineHeight;
    }
    
    if (isLong)
    {
        left = 0;
    }else
    {
        left = leftSpace;
    }
    lineLayer.frame = CGRectMake(CGRectGetMinX(bounds)+left, top, CGRectGetWidth(self.frame)-2*left, lineHeight);
    
    lineLayer.backgroundColor = color;
    
    [layer addSublayer:lineLayer];
}
@end
