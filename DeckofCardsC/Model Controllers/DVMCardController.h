//
//  DVMCardController.h
//  DeckofCardsC
//
//  Created by Jack Knight on 12/31/18.
//  Copyright © 2018 Jack Knight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVMCard.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMCardController : NSObject

+ (void) fetchCardWithCompletion: (void (^) (DVMCard * _Nullable))completion;

+ (void) fetchCardImageWith: (DVMCard * _Nullable)card
                 completion: (void (^) (UIImage *))completion;

@end

NS_ASSUME_NONNULL_END
