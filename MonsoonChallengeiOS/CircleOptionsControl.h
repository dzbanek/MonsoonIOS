//
//  CircleOptionsControl.h
//  MonsoonChallengeiOS
//
//  Created by Piotr on 10/11/14.
//  Copyright (c) 2014 pz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleOptionsControl : UIControl

@property (nonatomic) NSArray *options;
@property (nonatomic, readonly) NSString *selectedOption;
@property (nonatomic, readonly) NSUInteger selectedIndex;
@property (nonatomic, readonly) CGPoint middlePoint;

- (void)shuffle;
@end
