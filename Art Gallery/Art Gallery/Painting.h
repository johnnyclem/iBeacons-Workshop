//
//  Painting.h
//  AirLocate
//
//  Created by John Clem on 3/25/14.
//  Copyright (c) 2014 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Painting : NSObject

+ (Painting *)monaLisa;
+ (Painting *)starryNight;
+ (Painting *)lastSupper;

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIImage *image;

@end
