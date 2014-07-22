//
//  ViewController.m
//  integrationInsg
//
//  Created by Nicolas Cadena on 11/07/14.
//  Copyright (c) 2014 Nicolas Cadena. All rights reserved.
//

#import "ViewController.h"
#import "Facade.h"
//CLIENT ID : adf4593ba21043789578c701a56ba085
//CLIENT SECRET : f9a1a602e2a04ed3a805cf30596583d5

@interface ViewController ()


@end

@implementation ViewController
@synthesize jsonDictionary,responseString;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toInstagram
{
    NSString * stringUrl = @"https://api.instagram.com/oauth/authorize/?client_id=adf4593ba21043789578c701a56ba085&redirect_uri=integracionInsg://&response_type=code";
     NSURL* url = [NSURL URLWithString:stringUrl];
    NSLog(@"La primer url es: %@",url);
    [[UIApplication sharedApplication]openURL:url];
}

-(IBAction)requestAccessToken
{
    
    Facade *facade = [Facade instance];
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.instagram.com/oauth/access_token?client_id=adf4593ba21043789578c701a56ba085&client_secret=f9a1a602e2a04ed3a805cf30596583d5&grant_type=authorization_code&redirect_uri=integracionInsg://&code=%@",facade.code]];
    
    NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/oauth/access_token"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSDictionary *params = [[NSDictionary alloc]
                            initWithObjectsAndKeys:
                            @"adf4593ba21043789578c701a56ba085", @"client_id",
                            @"f9a1a602e2a04ed3a805cf30596583d5", @"client_secret",
                            @"authorization_code",@"grant_type",
                            @"integracionInsg://",@"redirect_uri",
                            [NSString stringWithFormat:@"%@",facade.code],@"code",
                            nil];
    [self connectionPOST:request withParams:params];
    
    NSLog(@"El token es: %@",[jsonDictionary valueForKey:@"access_token"]);
    facade.token = [jsonDictionary valueForKey:@"access_token"];

}

- (BOOL)connectionPOST:(NSURLRequest *)aRequest

            withParams:(NSDictionary *)aDictionary {
    
    
    
    responseString = nil;
    
    jsonDictionary = nil;
    
    
    
    if ([aDictionary count] > 0) {
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                        
                                        initWithURL:[aRequest URL]];
        
        [request setHTTPMethod:@"POST"];
        
        
        
        NSMutableString *postString = [[NSMutableString alloc] init];
        
        NSArray *allKeys = [aDictionary allKeys];
        
        for (int i = 0; i < [allKeys count]; i++) {
            
            NSString *key = [allKeys objectAtIndex:i];
            
            NSString *value = [aDictionary objectForKey:key];
            
            [postString appendFormat:( (i == 0) ? @"%@=%@" : @"&%@=%@" ), key, value];
            
        }
        
        
        
        [request setHTTPBody:[postString dataUsingEncoding:NSISOLatin1StringEncoding]];
        
        
        
        //[NSURLConnection connectionWithRequest:request delegate:self];
        
        
        
        NSError *requestError;
        
        NSURLResponse *urlResponse = nil;
        
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
        
        
        
        if (response == nil) {
            
            // Check for problems
            
            if (requestError != nil) {
                
                NSLog(@"POST ERROR %@", requestError);
                
            }
            
        }
        
        else{
            
            responseString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
            
            NSLog(@"response: %@",responseString);
            
            
            
            jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&requestError];
            
        }
        
        postString = nil;
        
        request = nil;
        
        
        
        return YES;
        
    } else {
        
        return NO;
        
    }
    
}

-(IBAction)getPopularPhoto
{
    Facade *facade = [Facade instance];
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.instagram.com/v1/tags/search?q=snowy&access_token=%@",facade.token]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSDictionary *dict = [[NSDictionary alloc]init];
    [self connectionGET:request withParams:dict];
    
    NSLog(@"LA RESPUESTA ES: %@",jsonDictionary);
//    facade.token = [jsonDictionary valueForKey:@"access_token"];
}

- (BOOL)connectionGET:(NSURLRequest *)aRequest

           withParams:(NSDictionary *)aDictionary {
    
    
    
    responseString = nil;
    
    jsonDictionary = nil;
    
    
    
    if (true)
    {
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                        
                                        initWithURL:[aRequest URL]];
        
        [request setHTTPMethod:@"GET"];
        
        
        
        NSMutableString *postString = [[NSMutableString alloc] init];
        
        NSArray *allKeys = [aDictionary allKeys];
        
        for (int i = 0; i < [allKeys count]; i++) {
            
            NSString *key = [allKeys objectAtIndex:i];
            
            NSString *value = [aDictionary objectForKey:key];
            
            [postString appendFormat:( (i == 0) ? @"%@=%@" : @"&%@=%@" ), key, value];
            
        }
        
        
        
        [request setHTTPBody:[postString dataUsingEncoding:NSISOLatin1StringEncoding]];
        
        
        
        //[NSURLConnection connectionWithRequest:request delegate:self];
        
        
        
        NSError *requestError;
        
        NSURLResponse *urlResponse = nil;
        
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
        
        
        
        if (response == nil) {
            
            // Check for problems
            
            if (requestError != nil) {
                
                NSLog(@"POST ERROR %@", requestError);
                
            }
            
        }
        
        else{
            
            responseString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
            
            NSLog(@"response: %@",responseString);
            
            
            
            jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&requestError];
            
        }
        
        postString = nil;
        
        request = nil;
        
        
        
        return YES;
        
    } else {
        
        return NO;
        
    }
    
}




@end
