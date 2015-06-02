//
//  ViewController.m
//  Matchismo
//
//  Created by pivotal on 6/2/15.
//  Copyright (c) 2015 Chris Hendrix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@end

@implementation ViewController

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (void)viewDidLoad
{
    self.flipCount = 0;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    UIImage *cardImage;
    NSString *cardTitle;
    if ([sender.currentTitle length]) {
        cardImage = [UIImage imageNamed:@"card-back"];
        cardTitle = @"";
    } else {
        cardImage = [UIImage imageNamed:@"card-front"];
        cardTitle = @"A♣︎";
    }
    [sender setBackgroundImage:cardImage
                      forState:UIControlStateNormal];
    [sender setTitle:cardTitle
            forState:UIControlStateNormal];
    
    self.flipCount++;
}

@end
