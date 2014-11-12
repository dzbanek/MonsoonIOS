//
//  ViewController.m
//  MonsoonChallengeiOS
//
//  Created by Piotr on 10/11/14.
//  Copyright (c) 2014 pz. All rights reserved.
//

#import "ViewController.h"
#import "ChosenOptionsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *options = @[
                          @[ @"one of a kind",@"small batch",@"large batch",@"mass market" ],
                          @[ @"savory",@"sweet",@"umami" ],
                          @[ @"crunchy",@"mushy",@"smooth"],
                          @[ @"spicy",@"mild" ],
                          @[ @"a little",@"a lot" ],
                          @[ @"breakfast",@"brunch",@"lunch",@"snack", @"dinner" ]
                        ];
    
    for (int i = 0; i < options.count ; i++)
    {
        CircleOptionsControl *circle = _circleOptions[i];
        circle.options = options[i];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSArray *)chosenOptions
{
    NSMutableArray *arrayOfOptions = [NSMutableArray arrayWithCapacity:_circleOptions.count];
    
    for (CircleOptionsControl *circle in _circleOptions)
    {
        [arrayOfOptions addObject:circle.selectedOption];
    }
    return arrayOfOptions;
}

- (IBAction)shuffleButtonPressed:(id)sender {
    for (CircleOptionsControl *circle in _circleOptions)
    {
        [circle shuffle];
    }
}
- (IBAction)goButtonPressed:(id)sender {
    ChosenOptionsViewController *chosenOptionsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"chosen_options_vc"];
    chosenOptionsVC.chosenOptions = self.chosenOptions;
    [self.navigationController pushViewController:chosenOptionsVC animated:YES];
}
@end
