//
//  CGDrawing.m
//  MonsoonChallengeiOS
//
//  Created by Piotr on 11/11/14.
//  Copyright (c) 2014 pz. All rights reserved.
//

#import "CGDrawing.h"
#import "UtilFunctions.h"

@implementation CGDrawing

+ (void)drawUnfilledArcInContext:(CGContextRef)ctx
                          center:(CGPoint)center
                          radius:(CGFloat)radius
                       lineWidth:(CGFloat)lineWidth
              fromAngleFromNorth:(CGFloat)fromAngleFromNorth
                toAngleFromNorth:(CGFloat)toAngleFromNorth
{
    float cartesianFromAngle = CompassToCartesian(ToRad(fromAngleFromNorth));
    float cartesianToAngle   = CompassToCartesian(ToRad(toAngleFromNorth));
    
    CGContextAddArc(ctx,
                    center.x,   // arc start point x
                    center.y,   // arc start point y
                    radius,     // arc radius from center
                    cartesianFromAngle, cartesianToAngle,
                    0); // iOS flips the y coordinate so anti-clockwise (specified here by 0) becomes clockwise (desired)!
    
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextDrawPath(ctx, kCGPathStroke);
}
@end
