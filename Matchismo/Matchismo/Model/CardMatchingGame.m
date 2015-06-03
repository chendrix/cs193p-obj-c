//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by pivotal on 6/2/15.
//  Copyright (c) 2015 Chris Hendrix. All rights reserved.
//

#import "CardMatchingGame.h"
#import "Card.h"
#import "Underscore.h"
#define _ Underscore

@interface CardMatchingGame ()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card

@end

@implementation CardMatchingGame

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int NO_MATCH = 0;
static const int COST_TO_CHOOSE = 1;

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        if (count < 2 || count > [deck size])
        {
            self = nil;
        } else {
            NSMutableArray *cards = [NSMutableArray new];
            for (int i = 0; i < count; i++) {
                [cards addObject:[deck drawRandomCard]];
            }
            self.cards = cards;
            self.score = 0;
        }
    }
    return self;
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (card.isMatched) return;
    
    if (card.isChosen) {
        // Toggle if it's already been chosen
        card.chosen = NO;
    } else {
        // Match against another card
        
        _.array(self.cards)
            .filter(^BOOL (Card *otherCard) {
                return otherCard.isChosen && !otherCard.isMatched;
            })
            .each(^(Card *potentialCard) {
                int matchScore = [card match:@[potentialCard]];
                
                if (matchScore == NO_MATCH) {
                    self.score -= MISMATCH_PENALTY;
                    potentialCard.chosen = NO;
                } else {
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    potentialCard.matched = YES;

                }

            });
        
        self.score -= COST_TO_CHOOSE;
        card.chosen = YES;
    }
    
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
