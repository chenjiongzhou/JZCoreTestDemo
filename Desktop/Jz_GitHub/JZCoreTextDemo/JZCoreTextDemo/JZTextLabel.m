//
//  JZTextLabel.m
//  JZCoreTextDemo
//
//  Created by jiong23 on 2017/4/21.
//  Copyright © 2017年 Chenjz. All rights reserved.
//

#import "JZTextLabel.h"
#import <CoreText/CoreText.h>

#define EOC_AtrributiKey_Width @"EOC_AtrributiKey_Width"
#define EOC_AtrributiKey_Height @"EOC_AtrributiKey_Height"

@interface JZTextLabel () {
    NSInteger imageIndex;
     UIImageView *_imageV;
    float imageX;
    float imageY;
}
@end
@implementation JZTextLabel

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
//    if (!_imageV) {
//        _imageV = [[UIImageView alloc] init];
//        _imageV.image = [UIImage imageNamed:@"1.jpg"];
//        _imageV.frame = CGRectMake(imageX, imageY, 100, 100);
//        _imageV.image = [UIImage imageNamed:@"1.jpg"];
//
//        [self addSubview:_imageV];
//    }
    
}

- (void)drawRect:(CGRect)rect {
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:[UIFont systemFontOfSize:18] forKey:NSFontAttributeName];
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self.text attributes:dict];
    
    [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, 4)];
    
    // 记录img起始weizhi
    imageIndex = attributeString.length;
    
    NSMutableAttributedString *attriImageStr = [self sepcailAttibuteStringWithWidth:100 height:100];
//    [attributeString appendAttributedString:attriImageStr];
    
    NSMutableAttributedString *otherStr = [[NSMutableAttributedString alloc] initWithString:@"=====JZzjzjzjzj"];
    [attributeString appendAttributedString:otherStr];
    
    // 1. 绘制文字
    
    // 绘制范围
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathAddRect(pathRef, NULL, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    
    CTFramesetterRef setterRef = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributeString);
    // range  ??
    CTFrameRef frameRef = CTFramesetterCreateFrame(setterRef, CFRangeMake(0, 0), pathRef, NULL);
    // 创建画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 调整坐标
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    // Y轴上依self.bounds.size.height
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    // Y轴反转
    CGContextScaleCTM(context, 1, -1);
    CTFrameDraw(frameRef, context);
    // 释放
    CFRelease(setterRef);
    CFRelease(pathRef);
    
    // 2.获取位置信息（特殊元素的位置信息）
    
    NSArray *lineArray = (__bridge NSArray *)CTFrameGetLines(frameRef);
    NSInteger lineCounts = lineArray.count;
    
    CGPoint lineOrigins[lineCounts]; // memset ??
    CTFrameGetLineOrigins(frameRef, CFRangeMake(0, 0), lineOrigins);
    
    double heightAddUp = 0; // 计算行高
    
    for (int i = 0; i < lineCounts; i++) {
        
        CTLineRef lineRef = (__bridge CTLineRef)lineArray[i];
        
        CGFloat ascent;
        CGFloat descent;
        CGFloat lineGap;
        // 获取 上行 下行 和 间隔高度
        CTLineGetTypographicBounds(lineRef, &ascent, &descent, &lineGap);
        
        NSArray *runArray = (__bridge NSArray *)CTLineGetGlyphRuns(lineRef);
        
        double starX  = 0; // x的开始坐标
        
        for (int j = 0; j < runArray.count; j++) {
            
            CTRunRef runRef = (__bridge CTRunRef)runArray[j];
            CFRange runRange = CTRunGetStringRange(runRef);
            
            // 获取run的宽度
            if (imageIndex >= runRange.location && imageIndex < runRange.location + runRange.length) {
                NSLog(@"找到image位置");
                
                imageY = heightAddUp;
                imageX = starX;
                
                _imageV = [[UIImageView alloc] init];
                _imageV.frame = CGRectMake(imageX, imageY, 100, 100);
                _imageV.image = [UIImage imageNamed:@"1.jpg"];
                [self addSubview:_imageV];
                
            }
            
            double runWidth = CTRunGetTypographicBounds(runRef, CFRangeMake(0, 0), 0, 0, 0);
            starX += runWidth;
        }
        heightAddUp += ascent + fabs(descent) + lineGap;
    }
    
    CFRelease(frameRef);
    
//    [self setNeedsLayout];
    
}

- (NSMutableAttributedString*)sepcailAttibuteStringWithWidth:(float)width height:(float)height {
    
    
    return nil;
    
}



@end
