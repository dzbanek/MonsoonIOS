//
//  ViewController.h
//  MonsoonChallengeiOS
//
//  Created by Piotr on 10/11/14.
//  Copyright (c) 2014 pz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleOptionsControl.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(CircleOptionsControl) NSArray *circleOptions;

@property (nonatomic, readonly) NSArray *chosenOptions;

@end

