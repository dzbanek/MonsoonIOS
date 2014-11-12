//
//  CGDrawing.h
//  MonsoonChallengeiOS
//
//  Created by Piotr on 11/11/14.
//  Copyright (c) 2014 pz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CGDrawing : NSObject
+ (void)drawUnfilledArcInContext:(CGContextRef)ctx
                          center:(CGPoint)center
                          radius:(CGFloat)radius
                       lineWidth:(CGFloat)lineWidth
              fromAngleFromNorth:(CGFloat)fromAngleFromNorth
                toAngleFromNorth:(CGFloat)toAngleFromNorth;
@end
