//
//  NSString+color.m
//  HotYQ
//
//  Created by 王建 on 15/8/17.
//  Copyright (c) 2015年 hotyq. All rights reserved.
//

#import "NSString+color.h"

@implementation NSString (color)


+ (NSMutableAttributedString *)orgStr:(NSString *)org color:(UIColor *)color font:(UIFont *)font text:(NSString *)text{
    
   
    
   
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:org];
    if (!text) {
        return str ;
    }
    NSRange range = [org rangeOfString:text];
    if (range.location != NSNotFound) {
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 7.0;
        [str addAttribute:NSParagraphStyleAttributeName
                    value:paragraphStyle range:range];
        [str addAttribute:NSForegroundColorAttributeName
                    value:color
                    range:range];
        [str addAttribute:NSFontAttributeName
                    value:font
                    range:range];
            }else{
//        NSLog(@"Not Found");
        return str;
    }
    return str;
    
}
+ (NSMutableAttributedString *)originalStr:(NSString*)_originalStr lastStr:(NSString *)lastStr color:(UIColor *)_color colorWithStr:(NSString *)_str
{
     NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:_originalStr];
    if (!_str) {
        return str;
    }
    NSRange range = [_originalStr rangeOfString:lastStr];
    NSRange rangeLast ;
    rangeLast.location = range.location + 2;
    rangeLast.length = _str.length;
    [str addAttribute:NSForegroundColorAttributeName value:_color range:rangeLast];
    return str;
}



+ (NSMutableAttributedString *)originalStr:(NSString*)_originalStr lastStr:(NSString *)lastStr lastStr1:(NSString *)lastStr1  colorWithStr:(NSString *)_str  colorWithStr:(NSString *)_str1
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:_originalStr];
    if (!_str) {
        return str;
    }
    NSRange range = [_originalStr rangeOfString:lastStr];
     NSRange range1 = [_originalStr rangeOfString:lastStr1];
    NSRange rangeLast ;
    rangeLast.location = range.location + 1;
    rangeLast.length = _str.length;
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor color_appRed] range:rangeLast];
    
    
    NSRange rangeLast1;
    rangeLast1.location = range1.location + 1;
    rangeLast1.length = _str1.length;
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor color_appRed] range:rangeLast1];

    return str;
}

+ (NSMutableAttributedString *) originalStr:(NSString*)_originalStr colorWithStr:(NSString *)_str secondStr:(NSString *)second color:(UIColor *)_color secondCorlor:(UIColor *)secondColor
{
    

/*每个字符*/
//   

    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:_originalStr];

    if (!_str) {
        return str;
    }
    NSRange range = [_originalStr rangeOfString:_str];
    if (range.location != NSNotFound) {
        [str addAttribute:NSForegroundColorAttributeName value:_color range:range];
    }else{
//        NSLog(@"Not Found");
        return str;
    }
    NSRange range2 = [_originalStr rangeOfString:second];
    if (range.location != NSNotFound) {
        [str addAttribute:NSForegroundColorAttributeName value:secondColor range:range2];
    }else{
//        NSLog(@"Not Found");
        return str;
    }

    return str;
//    
//
//    //过滤英文
//    NSString *chinese = [NSString excludeEnglish:_str];
//    //过滤中文
//    NSString *english = [NSString excludeChinses:_str excStr:chinese];
//    //英文单纯变色
//        for (int a = 0; a < _originalStr.length; a ++) {
//            NSString *orgStr =   [_originalStr substringWithRange:NSMakeRange(a,1)];
////            NSLog(@"%@",orgStr);
//    
//            for (int i = 0; i < chinese .length; i ++) {
//    
//                NSString *subStr =   [chinese substringWithRange:NSMakeRange(i,1)];
//    
//    
//                if ([subStr caseInsensitiveCompare:orgStr] == NSOrderedSame) {
//                    [str addAttribute:NSForegroundColorAttributeName value:_color range:NSMakeRange(a,1)];
//    
//                }
//                
//            }
//            
//        }
//    
//
//    
//    
//    
//    //中文字符变色
//    for (int a = 0; a < _originalStr.length; a ++) {
//                if (_originalStr.length - a < english.length) {
//                    break;
//                }
//                NSString *orgStr =   [_originalStr substringWithRange:NSMakeRange(a,english.length)];
////                NSLog(@"%@",orgStr);
//        
//                for (int i = 0; i < english.length; i ++) {
//        
//                    NSString *subStr =   english;
////                    NSLog(@"%@",subStr);
//                    if (english.length < 3) {
//                        break;
//                    }
//
//                    if ([subStr caseInsensitiveCompare:orgStr] == NSOrderedSame) {
//                        [str addAttribute:NSForegroundColorAttributeName value:_color range:NSMakeRange(a,english.length)];
//        
//                    }
//                    
//                }
//           
//            }
//
//    
//    return str;
}
+ (NSMutableAttributedString *) filterNilOriginalStr:(NSString*)_originalStr colorWithStr:(NSString *)_str secondStr:(NSString *)second color:(UIColor *)_color secondCorlor:(UIColor *)secondColor
{
    if (_originalStr == nil) {
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@""];
        return str;
    }
    if (_str == nil || second == nil) {
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:_originalStr];
        return str;
    }
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:_originalStr];
    if (!_str) {
        return str;
    }
    NSRange range = [_originalStr rangeOfString:_str];
    if (range.location != NSNotFound) {
        [str addAttribute:NSForegroundColorAttributeName value:_color range:range];
    }else{
//        NSLog(@"Not Found");
        return str;
    }
    NSRange range2 = [_originalStr rangeOfString:second];
    if (range.location != NSNotFound) {
        [str addAttribute:NSForegroundColorAttributeName value:secondColor range:range2];
    }else{
//        NSLog(@"Not Found");
        return str;
    }

    return str;
}
//判断是否有中文
+ (BOOL)IsChinese:(NSString *)str
{ for(int i=0; i< [str length];i++)
        { int a = [str characterAtIndex:i];
    if( a > 0x4e00 && a < 0x9fff)
            {
                return YES;
                
            }
            
        }
    return NO;
}
+ (NSString *)excludeEnglish:(NSString *)str
{

//    NSLog(@"Hello, World!");
    NSString *tempString = str;
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQISTUVWXYZabcdefghigkmnopqistuvwxyz,.';?\\|~(＜＞$%^&*)_+ "];
    
    tempString = [[tempString componentsSeparatedByCharactersInSet: doNotWant]componentsJoinedByString: @""];
    NSLog(@" str = %@",tempString);
    return tempString;
}

+ (NSString *)excludeChinses:(NSString *)str excStr:(NSString *)excStr
{
    
    
//    NSLog(@"Hello, World!");
    NSString *tempString = str;
    if (!excStr) {
        return tempString;
    }
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:excStr];
    
    tempString = [[tempString componentsSeparatedByCharactersInSet: doNotWant]componentsJoinedByString: @""];
//    NSLog(@" str = %@",tempString);
    return tempString;
}

@end
