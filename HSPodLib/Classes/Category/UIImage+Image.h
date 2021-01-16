//
//  UIImage+Image.h
//  liaoliao
//
//  Created by 华华生升 on 2016/12/28.
//  Copyright © 2016年 liaoliaokeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

/**
 通过一个color来生成一个图片

 @param color 传入的色值
 @return UIImage

 */
+(UIImage *)createImageFor:(UIColor *)color;

/**
 通过一个color来生成一个图片

 @param color 传入的色值
 @param size 需要生成图片的大小
 @return UIImage
 */
+(UIImage *)createImageFor:(UIColor *)color forCGSize:(CGSize)size;
/**
 通过一个color来生成一个图片
 
 @param size 需要生成图片的大小
 @return UIImage
 */
+(UIImage *)createImageforCGSize:(CGSize)size;

/**
 设置图片的圆角

 @param image 传入的图片
 @return 需要的圆角图片
 */
+(UIImage *)radiusImageforImage:(UIImage *)image;

/**
 上传照片的时候的，弹出框

 @param actionSheet UIActionSheet
 @return 返回选择的图片
 */
+(UIImage *)getPictureForPhoto:(UIActionSheet *)actionSheet;

/**
 对图片进行裁剪

 @param image 传入的图片
 @param asize 裁剪的图片的大小
 @return 返回裁剪后的图片大小
 */
+(UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;


+ (UIImage *)drawLineByImageView:(UIImageView *)imageView;

+ (UIImage *)drawPlaceholderImageByImageView:(UIImageView *)imageView forColor:(UIColor *)color;

-(NSData *)compressWithMaxLength:(NSUInteger)maxLength;
@end
