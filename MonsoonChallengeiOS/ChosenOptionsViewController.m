//
//  ChosenOptionsViewController.m
//  MonsoonChallengeiOS
//
//  Created by Piotr on 12/11/14.
//  Copyright (c) 2014 pz. All rights reserved.
//

#import "ChosenOptionsViewController.h"

@interface ChosenOptionsViewController ()

@end

@implementation ChosenOptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSString *optionsTitle = [_chosenOptions componentsJoinedByString:@"\n"];
    _label.numberOfLines = _chosenOptions.count;
    _label.text = optionsTitle;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
