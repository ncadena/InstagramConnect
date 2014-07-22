//
//  Facade.h
//  integrationInsg
//
//  Created by Nicolas Cadena on 14/07/14.
//  Copyright (c) 2014 Nicolas Cadena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Facade : NSObject

@property NSString* code;
@property NSString* token;

+(id)instance;

@end
