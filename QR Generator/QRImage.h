//
//  QRImage.h
//  QR Generator
//
//  Created by Vadim Maslov on 19.10.14.
//  Copyright (c) 2014 Vadim Maslov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QRImage : NSObject

@property (nonatomic, strong,readonly) UIImage *image;

- (id)initWithString:(NSString *)str;

@end
