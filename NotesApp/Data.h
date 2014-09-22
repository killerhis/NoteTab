//
//  Data.h
//  NotesApp
//
//  Created by Hicham Chourak on 09/07/14.
//  Copyright (c) 2014 Hicham Chourak. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDefaultText @""
#define kAllNotes @"notes"
#define kDetailView @"showDetail"

@interface Data : NSObject

+ (NSMutableDictionary *)getAllNotes;
+ (void)setCurrentKey:(NSString *)key;
+ (NSString *)getCurrentKey;
+ (void)SetNoteForCurrentKey:(NSString *)note;
+ (void)setNote:(NSString *)note forKey:(NSString *)key;
+ (void)removeNoteForKey:(NSString *)key;
+ (void)saveNotes;

@end
