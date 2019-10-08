//
//  TRWEntryController.h
//  JournalObjC
//
//  Created by Travis Wheeler on 10/7/19.
//  Copyright © 2019 Travis Wheeler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRWEntry.h"

@interface TRWEntryController : NSObject

+ (TRWEntryController *)sharedController;

- (void)saveToPersistentStorage;

@property(nonatomic,strong,readonly) NSArray * entries;
-(void)addEntriesObject:(TRWEntry *)entry;
-(void)removeEntriesObject:(TRWEntry *)entry;

@end
