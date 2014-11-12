//
//  UtilFunctions.h
//  MonsoonChallengeiOS
//
//  Created by Piotr on 11/11/14.
//  Copyright (c) 2014 pz. All rights reserved.
//

#ifndef MonsoonChallengeiOS_UtilFunctions_h
#define MonsoonChallengeiOS_UtilFunctions_h
#define RGB(r, g, b) [UIColor colorWithRed:(float)r / 255.0 green:(float)g / 255.0 blue:(float)b / 255.0 alpha:1.0]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(float)r / 255.0 green:(float)g / 255.0 blue:(float)b / 255.0 alpha:a]

/**
 *  Macro for converting radian degrees from cartesian reference (0 radians is along X axis)
 *   to 'compass style' reference (0 radians is along Y axis (ie North on a compass)).
 *
 *  @param rad Radian degrees to convert from Cartesian reference
 *
 *  @return Radian Degrees in 'Compass' reference
 */
#define CartesianToCompass(rad) ( rad + M_PI/2 )
/**
 *  Macro for converting radian degrees from 'compass style' reference (0 radians is along Y axis (ie North on a compass))
 *   to cartesian reference (0 radians is along X axis).
 *
 *  @param rad Radian degrees to convert from 'Compass' reference
 *
 *  @return Radian Degrees in Cartesian reference
 */
#define CompassToCartesian(rad) ( rad - M_PI/2 )
#define ToRad(deg) 		( (M_PI * (deg)) / 180.0 )
#define ToDeg(rad)		( (180.0 * (rad)) / M_PI )
#define SQR(x)			( (x) * (x) )
#endif
