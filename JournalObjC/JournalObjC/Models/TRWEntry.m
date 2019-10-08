//
//  TRWEntry.m
//  JournalObjC
//
//  Created by Travis Wheeler on 10/7/19.
//  Copyright © 2019 Travis Wheeler. All rights reserved.
//

#import "TRWEntry.h"

static NSString * const TitleKey = @"title";
static NSString * const TextKey = @"text";
static NSString * const TimeStampKey = @"timestamp";

@implementation TRWEntry

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timeStamp:(NSDate *)timestamp
{
    self = [super init];
    if (self)
    {
        _title = title;
        _text = text;
        _timeStamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[TitleKey];
    NSString *text = dictionary[TextKey];
    NSDate *timestamp = dictionary[TimeStampKey];
    return [self initWithTitle:title text:text timeStamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{TitleKey: self.title, TextKey: self.text, TimeStampKey: self.timeStamp};
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass: [TRWEntry class]]) { return NO; }
    return [[self dictionaryRepresentation] isEqualToDictionary:[(TRWEntry *)object dictionaryRepresentation]];
}

@end
