//
//  TRWEntry.h
//  JournalObjC
//
//  Created by Travis Wheeler on 10/7/19.
//  Copyright © 2019 Travis Wheeler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRWEntry : NSObject


- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timeStamp:(NSDate *)timeStamp;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * text;
@property (nonatomic, strong) NSDate * timeStamp;

@end
