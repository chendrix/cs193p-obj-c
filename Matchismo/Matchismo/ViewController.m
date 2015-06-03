//
//  ViewController.m
//  Matchismo
//
//  Created by pivotal on 6/2/15.
//  Copyright (c) 2015 Chris Hendrix. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic) Deck *deck;

@end

@implementation ViewController


- (void)viewDidLoad
{
    self.flipCount = 0;
    self.deck = [self createDeck];
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
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
        
        [sender setBackgroundImage:cardImage
                          forState:UIControlStateNormal];
        [sender setTitle:cardTitle
                forState:UIControlStateNormal];
    } else {
        cardImage = [UIImage imageNamed:@"card-front"];
        
        Card *card = [self.deck drawRandomCard];
        
        if (card) {
            cardTitle = card.contents;

            [sender setBackgroundImage:cardImage
                              forState:UIControlStateNormal];
            [sender setTitle:cardTitle
                    forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
    
    
}

@end
