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
+ (TRWEntryController *)sharedInstance {
    static TRWEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [TRWEntryController new];
    });
    return sharedInstance;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _internalEntries= [NSMutableArray array];
    } return self;
}

@end
