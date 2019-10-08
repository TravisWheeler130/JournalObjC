//
//  TRWEntryController.m
//  JournalObjC
//
//  Created by Travis Wheeler on 10/7/19.
//  Copyright © 2019 Travis Wheeler. All rights reserved.
//

#import "TRWEntryController.h"

static NSString *const EntriesKeys = @"entries";
@interface TRWEntryController()
@property(nonatomic,strong) NSMutableArray * internalEntries;

@end

@implementation TRWEntryController
+ (TRWEntryController *)sharedController
{
    static TRWEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [TRWEntryController new];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _internalEntries= [NSMutableArray array];
    }
    return self;
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (TRWEntry *entry in self.entries)
    {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKeys];
}

- (void)loadFromPersistentStorage
{
    NSArray *entrydictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKeys];
    for (NSDictionary *dictionary in entrydictionaries)
    {
        TRWEntry *entry = [[TRWEntry alloc] initWithDictionary:dictionary];
        [self addEntriesObject:entry];
    }
}

- (NSArray *)entries { return self.internalEntries; }

- (void)addEntriesObject:(TRWEntry *)entry
{
    [self.internalEntries addObject:entry];
}

- (void)removeEntriesObject:(TRWEntry *)entry
{
    [self.internalEntries removeObject:entry];
}

@end
