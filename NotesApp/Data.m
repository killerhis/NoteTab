//
//  Data.m
//  NotesApp
//
//  Created by Hicham Chourak on 09/07/14.
//  Copyright (c) 2014 Hicham Chourak. All rights reserved.
//

#import "Data.h"

@implementation Data

static NSMutableDictionary *allNotes;
static NSString *currentKey;

+ (NSMutableDictionary *)getAllNotes
{
    if (allNotes == nil) {
        allNotes = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kAllNotes]];
        
    }
    
    return allNotes;
}

+ (void)setCurrentKey:(NSString *)key
{
    currentKey = key;
}

+ (NSString *)getCurrentKey
{
    return currentKey;
}

+ (void)SetNoteForCurrentKey:(NSString *)note
{
    [self setNote:note forKey:currentKey];
}

+ (void)setNote:(NSString *)note forKey:(NSString *)key
{
    [allNotes setObject:note forKey:key];
}

+ (void)removeNoteForKey:(NSString *)key
{
    [allNotes removeObjectForKey:key];
}

+ (void)saveNotes
{
    [[NSUserDefaults standardUserDefaults] setObject:allNotes forKey:kAllNotes];
}

@end