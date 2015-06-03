//
//  ViewController.m
//  Matchismo
//
//  Created by pivotal on 6/2/15.
//  Copyright (c) 2015 Chris Hendrix. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "Underscore.h"
#define _ Underscore

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation ViewController


- (void)viewDidLoad
{
    self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %li", self.game.score];
}

- (NSString *)titleForCard:(Card *)card
{
    return (card.isChosen) ? card.contents : nil;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:(card.isChosen) ? @"card-front" : @"card-back"];
}

@end
