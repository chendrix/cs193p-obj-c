//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by pivotal on 6/2/15.
//  Copyright (c) 2015 Chris Hendrix. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSNumber *rank in [PlayingCard validRanks]) {
                PlayingCard *card = [[PlayingCard alloc] initWithSuit:suit rank:rank];
                [self addCard:card atTop:YES];
            }
        }
    }
    return self;
}

@end
