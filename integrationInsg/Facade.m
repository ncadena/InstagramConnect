//
//  Facade.m
//  integrationInsg
//
//  Created by Nicolas Cadena on 14/07/14.
//  Copyright (c) 2014 Nicolas Cadena. All rights reserved.
//

#import "Facade.h"

@implementation Facade

@synthesize code,token;


+(id)instance
{
    // singleton instance of this facade
    static Facade *instance = nil;
    if (instance == nil)
    {
        instance = [Facade alloc];
    }
    
    return instance;
}

@end
