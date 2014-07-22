//
//  ViewController.h
//  integrationInsg
//
//  Created by Nicolas Cadena on 11/07/14.
//  Copyright (c) 2014 Nicolas Cadena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


//CLIENT ID : adf4593ba21043789578c701a56ba085
//CLIENT SECRET : f9a1a602e2a04ed3a805cf30596583d5

//POST
@property (strong,nonatomic) NSDictionary* jsonDictionary;
@property (strong,nonatomic) NSString* responseString;

- (IBAction)toInstagram;
-(IBAction)requestAccessToken;
-(IBAction)getPopularPhoto;

@end
