//
//  IAViewController.m
//  IAElegantSheet
//
//  Created by Ikhsan Assaat on 6/30/13.
//  Copyright (c) 2013 3kunci. All rights reserved.
//

#import "IAViewController.h"
#import "IAElegantSheet.h"

@interface IAViewController ()

@property (strong, nonatomic) IAElegantSheet *sheet;

@end

@implementation IAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    [self addButton];
    [self.view setBackgroundColor:[UIColor colorWithWhite:.9 alpha:1.0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Show Elegance" forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button addTarget:self action:@selector(showElegantSheet:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // autolayout code
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:button.superview attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:button.superview attribute:NSLayoutAttributeCenterY multiplier:1.f constant:0.f];
    [self.view addConstraint:constraint];
}

#pragma mark - Elegant sheet

- (IAElegantSheet *)sheet {
    if (!_sheet) {
        
        __weak typeof(self) weakSelf = self;
        
        _sheet = [IAElegantSheet elegantSheetWithTitle:@"Elegant Sheet"];
        [_sheet addButtonsWithTitle:@"Elegant to code" block:^{
            [weakSelf alert:@"Using blocks handler"];
        }];
        [_sheet addButtonsWithTitle:@"Elegant to see" block:^{
            [weakSelf alert:@"Using custom views"];
        }];
        [_sheet addButtonsWithTitle:@"Custom font by default" block:^{
            [weakSelf alert:@"Using Roboto for default font"];
        }];
        [_sheet setDestructiveButtonWithTitle:@"Danger Button" block:^{
            [weakSelf alert:@"Do something dangerous"];
        }];
        [_sheet setCancelButtonWithTitle:@"Thanks!" block:^{
            NSLog(@"\nCreated by Ikhsan Assaat for 'Back On The Map'. \n#backonthemap #objectivechackathon \nhttps://objectivechackathon.appspot.com/‎");
        }];
        
    }
    
    return _sheet;
}

- (void)showElegantSheet:(UIButton *)button {
    [self.sheet showInView:self.view];
}

- (void)alert:(NSString *)alertMessage {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Elegant Sheet" message:alertMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
