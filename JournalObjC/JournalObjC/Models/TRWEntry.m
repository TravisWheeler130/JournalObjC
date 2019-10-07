//
//  TRWEntry.m
//  JournalObjC
//
//  Created by Travis Wheeler on 10/7/19.
//  Copyright © 2019 Travis Wheeler. All rights reserved.
//

#import "TRWEntry.h"

@implementation TRWEntry

- (instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    self = [super init];
    if (self)
    {
        _title = title;
        _bodyText = bodyText;
        _timeStamp = [NSDate date];
    }
    return self;
}

@end
