//
//  ChosenOptionsViewController.h
//  MonsoonChallengeiOS
//
//  Created by Piotr on 12/11/14.
//  Copyright (c) 2014 pz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChosenOptionsViewController : UIViewController

@property (nonatomic, strong) NSArray *chosenOptions;
@property (weak, nonatomic) IBOutlet UILabel *label;
@end
