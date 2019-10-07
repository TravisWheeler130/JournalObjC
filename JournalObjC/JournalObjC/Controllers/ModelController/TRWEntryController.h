//
//  TRWEntryController.h
//  JournalObjC
//
//  Created by Travis Wheeler on 10/7/19.
//  Copyright © 2019 Travis Wheeler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRWEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface TRWEntryController : NSObject

+ (TRWEntryController *)sharedController;
@property(nonatomic,strong,readonly) NSArray * entries;
-(void)addEntriesObject:(TRWEntry *)entry;
-(void)removeEntriesObject:(TRWEntry *)entry;

@end

NS_ASSUME_NONNULL_END
