//
//  UIImage+Color.m
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)
void ProviderReleaseData (void *info, const void *data, size_t size)
{
    free((void*)data);
}
+ (UIImage*) imageBlackToTransparent:(UIImage*) image
{
    // 分配内存
    const int imageWidth = image.size.width;
    const int imageHeight = image.size.height;
    size_t      bytesPerRow = imageWidth * 4;
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    
    // 创建context
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    
    // 遍历像素
    int pixelNum = imageWidth * imageHeight;
    uint32_t* pCurPtr = rgbImageBuf;
    for (int i = 0; i < pixelNum; i++, pCurPtr++)
    {
        if ((*pCurPtr & 0xFFFFFF00) == 0xffffff00)    // 将白色变成透明
        {
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[0] = 0;
        }
//        else
//        {
            // 改成下面的代码，会将图片转成想要的颜色
//            uint8_t* ptr = (uint8_t*)pCurPtr;
//            ptr[3] = 0; //0~255
//            ptr[2] = 0;
//            ptr[1] = 0;
            
//        }
        
    }
    
    // 将内存转成image
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace,
                                        kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider,
                                        NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    
    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
    
    // 释放
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    // free(rgbImageBuf) 创建dataProvider时已提供释放函数，这里不用free
    
    return resultUIImage;
}
+ (UIImage*)getGrayImage:(UIImage*)sourceImage
{
//    int width = sourceImage.size.width;
//    int height = sourceImage.size.height;
//    
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
//    CGContextRef context = CGBitmapContextCreate (nil,width,height,8,0,colorSpace,kCGImageAlphaNone);
//    CGColorSpaceRelease(colorSpace);
//    
//    if (context == NULL) {
//        return nil;
//    }
//    
//    CGContextDrawImage(context,CGRectMake(0, 0, width, height), sourceImage.CGImage);
//    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
//    CGContextRelease(context);
//    
//    return grayImage;
    return [UIImage grayscale:sourceImage type:1];
}
+(UIImage*) grayscale:(UIImage*)anImage type:(char)type {
    CGImageRef  imageRef;
    imageRef = anImage.CGImage;
    
    size_t width  = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);
    
    // ピクセルを構成するRGB各要素が何ビットで構成されている
    size_t                  bitsPerComponent;
    bitsPerComponent = CGImageGetBitsPerComponent(imageRef);
    
    // ピクセル全体は何ビットで構成されているか
    size_t                  bitsPerPixel;
    bitsPerPixel = CGImageGetBitsPerPixel(imageRef);
    
    // 画像の横1ライン分のデータが、何バイトで構成されているか
    size_t                  bytesPerRow;
    bytesPerRow = CGImageGetBytesPerRow(imageRef);
    
    // 画像の色空間
    CGColorSpaceRef         colorSpace;
    colorSpace = CGImageGetColorSpace(imageRef);
    
    // 画像のBitmap情報
    CGBitmapInfo            bitmapInfo;
    bitmapInfo = CGImageGetBitmapInfo(imageRef);
    
    // 画像がピクセル間の補完をしているか
    bool                    shouldInterpolate;
    shouldInterpolate = CGImageGetShouldInterpolate(imageRef);
    
    // 表示装置によって補正をしているか
    CGColorRenderingIntent  intent;
    intent = CGImageGetRenderingIntent(imageRef);
    
    // 画像のデータプロバイダを取得する
    CGDataProviderRef   dataProvider;
    dataProvider = CGImageGetDataProvider(imageRef);
    
    // データプロバイダから画像のbitmap生データ取得
    CFDataRef   data;
    UInt8*      buffer;
    data = CGDataProviderCopyData(dataProvider);
    buffer = (UInt8*)CFDataGetBytePtr(data);
    
    // 1ピクセルずつ画像を処理
    NSUInteger  x, y;
    for (y = 0; y < height; y++) {
        for (x = 0; x < width; x++) {
            UInt8*  tmp;
            tmp = buffer + y * bytesPerRow + x * 4; // RGBAの4つ値をもっているので、1ピクセルごとに*4してずらす
            
            // RGB値を取得
            UInt8 red,green,blue;
            red = *(tmp + 0);
            green = *(tmp + 1);
            blue = *(tmp + 2);
            
            UInt8 brightness;
            
            switch (type) {
                case 1://モノクロ
                    // 輝度計算
                    brightness = (77 * red + 28 * green + 151 * blue) / 256;
                    
                    *(tmp + 0) = brightness;
                    *(tmp + 1) = brightness;
                    *(tmp + 2) = brightness;
                    break;
                    
                case 2://セピア
                    *(tmp + 0) = red;
                    *(tmp + 1) = green * 0.7;
                    *(tmp + 2) = blue * 0.4;
                    break;
                    
                case 3://色反転
                    *(tmp + 0) = 255 - red;
                    *(tmp + 1) = 255 - green;
                    *(tmp + 2) = 255 - blue;
                    break;
                    
                default:
                    *(tmp + 0) = red;
                    *(tmp + 1) = green;
                    *(tmp + 2) = blue;
                    break;
            }
            
        }
    }
    
    // 効果を与えたデータ生成
    CFDataRef   effectedData;
    effectedData = CFDataCreate(NULL, buffer, CFDataGetLength(data));
    
    // 効果を与えたデータプロバイダを生成
    CGDataProviderRef   effectedDataProvider;
    effectedDataProvider = CGDataProviderCreateWithCFData(effectedData);
    
    // 画像を生成
    CGImageRef  effectedCgImage;
    UIImage*    effectedImage;
    effectedCgImage = CGImageCreate(
                                    width, height,
                                    bitsPerComponent, bitsPerPixel, bytesPerRow,
                                    colorSpace, bitmapInfo, effectedDataProvider,
                                    NULL, shouldInterpolate, intent);
    effectedImage = [[UIImage alloc] initWithCGImage:effectedCgImage];
    
    // データの解放
    CGImageRelease(effectedCgImage);
    CFRelease(effectedDataProvider);
    CFRelease(effectedData);
    CFRelease(data);
    
    return effectedImage;
}
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
+ (UIImage *)placeholderImage{
//    return [self imageWithColor:[UIColor colorFromHexRGB:@"#e6e6e6"]];
   return  [UIImage imageNamed:@"pic_default"];
}
+ (UIImage *)placeholderHanderImage
{
// return [UIImage imageNamed:@"ios_avatar_holder"];
    return  [UIImage imageNamed:@"portrait_default"];
}
+ (UIImage *)placeholderClearImage{
    return [self imageWithColor:[UIColor clearColor]];
}
+ (UIImage *)placeholderDefaultImage{
    UIImage *image = [UIImage imageNamed:@"app_default_image"];//{top, left, bottom, right};
    return image;
}
- (UIColor *)colorAtPoint:(CGPoint )point
{
    if (point.x < 0 || point.y < 0) return nil;
    
    CGImageRef imageRef = self.CGImage;
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    if (point.x >= width || point.y >= height) return nil;
    
    unsigned char *rawData = malloc(height * width * 4);
    if (!rawData) return nil;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    CGContextRef context = CGBitmapContextCreate(rawData,
                                                 width,
                                                 height,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast
                                                 | kCGBitmapByteOrder32Big);
    if (!context) {
        free(rawData);
        return nil;
    }
    CGColorSpaceRelease(colorSpace);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
    
    int byteIndex = (bytesPerRow * point.y) + point.x * bytesPerPixel;
    CGFloat red   = (rawData[byteIndex]     * 1.0) / 255.0;
    CGFloat green = (rawData[byteIndex + 1] * 1.0) / 255.0;
    CGFloat blue  = (rawData[byteIndex + 2] * 1.0) / 255.0;
    CGFloat alpha = (rawData[byteIndex + 3] * 1.0) / 255.0;
    
    UIColor *result = nil;
    result = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    free(rawData);
    return result;
}
- (UIColor *)colorAtPixel:(CGPoint)point
{
    // Cancel if point is outside image coordinates
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), point)) {
        return nil;
    }
    
    // Create a 1x1 pixel byte array and bitmap context to draw the pixel into.
    // Reference: http://stackoverflow.com/questions/1042830/retrieving-a-pixel-alpha-value-for-a-uiimage
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = self.CGImage;
    NSUInteger width = self.size.width;
    NSUInteger height = self.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,
                                                 1,
                                                 1,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    // Draw the pixel we are interested in onto the bitmap context
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    // Convert color values [0..255] to floats [0.0..1.0]
    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (BOOL)hasAlphaChannel
{
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}





- (NSInteger)length{
    NSData *imageData = UIImageJPEGRepresentation(self, 1);
    return imageData.length / 1024;
}




+ (UIImage *)gaussianBlur:(UIImage *)img{
//    CIContext *context = [CIContext contextWithOptions:nil];
    
//    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
//    [filter setValue:image forKey:kCIInputImageKey];
//    [filter setValue:@2.0f forKey: @"inputRadius"];
//    CIImage *result = [filter valueForKey:kCIOutputImageKey];
//    CGImageRef outImage = [context createCGImage: result fromRect:[result extent]];
//    UIImage * blurImage = [UIImage imageWithCGImage:outImage];
//    return blurImage;
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithImage:img];
    // create gaussian blur filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:10.0] forKey:@"inputRadius"];
    // blur image
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);

    return image;

}

@end
