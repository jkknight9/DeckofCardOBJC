//
//  DVMCardController.m
//  DeckofCardsC
//
//  Created by Jack Knight on 12/31/18.
//  Copyright © 2018 Jack Knight. All rights reserved.
//

#import "DVMCardController.h"
#import <UIKit/UIKit.h>

@implementation DVMCardController


+ (void)fetchCardWithCompletion:(void (^)(DVMCard * _Nullable))completion
{
    //URL
    NSURL *baseURL = [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/new/draw/?count=1"];
    NSLog(@"%@", baseURL.absoluteString);
    
    //DataTask + Resume
    
    [[[NSURLSession sharedSession] dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
        }
        if (data == nil) {
            NSLog(@"There was an error getting the card");
            completion(nil);
            return;
        }
        NSDictionary *cardDictionary = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error:&error];
        if (cardDictionary == nil) {
            completion(nil);
            return;
        }
        
        
        DVMCard *card = [[DVMCard alloc] initWithDictionary:cardDictionary];
        completion(card);
    }]resume];
    
}

+ (void)fetchCardImageWith:(DVMCard *)card completion:(void (^)(UIImage * _Nonnull))completion
{
    //URL
    NSURL *imageURL = [NSURL URLWithString:[card image]];
    
    //DataTask + Resume
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (data == nil) {
            NSLog(@"There was an error getting the card");
            completion(nil);
            return;
        }
        UIImage *cardImage = [[UIImage alloc] initWithData:data];
        completion(cardImage);
    }]resume];
}
@end
