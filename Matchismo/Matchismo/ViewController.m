//
//  ViewController.m
//  Matchismo
//
//  Created by pivotal on 6/2/15.
//  Copyright (c) 2015 Chris Hendrix. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic) PlayingCardDeck *deck;

@end

@implementation ViewController


- (void)viewDidLoad
{
    self.flipCount = 0;
    self.deck = [[PlayingCardDeck alloc] init];
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    UIImage *cardImage;
    NSString *cardTitle;
    
    if ([sender.currentTitle length]) {
        cardImage = [UIImage imageNamed:@"card-back"];
        cardTitle = @"";
    } else {
        UIColor *color;
        cardImage = [UIImage imageNamed:@"card-front"];
        
        PlayingCard *card = [self.deck drawRandomCard];
        cardTitle = card.contents;
        
        if ([card isRedCard]) {
            color = [UIColor redColor];
        } else {
            color = [UIColor blackColor];
        }
        [sender setTitleColor:color forState:UIControlStateNormal];
        
    }
    
    [sender setBackgroundImage:cardImage
                      forState:UIControlStateNormal];
    [sender setTitle:cardTitle
            forState:UIControlStateNormal];
    
    self.flipCount++;
}

@end
