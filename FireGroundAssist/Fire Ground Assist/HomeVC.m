//
//  HomeVC.m
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeVC.h"
#import "FGBuilding.h"

@implementation HomeVC

- (IBAction) findBuilding
{
    [addressField resignFirstResponder]; 
    NSString *addr = [addressField.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *url = [NSString stringWithFormat:@"http://www.firegroundassist.com/building?address=%@", addr];
    NSLog(@"findBuilding: %@", url);
    
    if (req!=nil){ req.delegate =nil; [req release]; req = nil; }
    req = [[URLRequest alloc] initWithAddress:url parameters:nil];
    req.delegate = self;
    [req setHttpMethod:@"GET"];
    [req sendRequest];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField              // called when 'return' key pressed. return NO to ignore.
{
    [textField resignFirstResponder];
    return  TRUE;
}

- (void)requestData:(NSArray *)pkg
{
    if (pkg!=nil){
        NSString *json = [[NSString alloc] initWithData:[pkg objectAtIndex:1] encoding:NSUTF8StringEncoding];
        NSDictionary *d = [json JSONValue];
        
        NSDictionary *results = [d objectForKey:@"results"];
        NSString *confirmation = [results objectForKey:@"confirmation"];
        NSLog(@"%@", [results description]);
        [json release];
        
        if ([confirmation isEqualToString:@"found"]){
            rslt.text = [results objectForKey:@"name"];
            rsltAddress.text = [results objectForKey:@"address"];
            NSArray *accessInfo = [results objectForKey:@"access info"];
            for (NSString *a in accessInfo) {
                NSArray *components = [a componentsSeparatedByString:@"=="];
                NSString *paramter = [components objectAtIndex:0];
                NSString *value = [components objectAtIndex:1];
                NSString *output = [[paramter stringByAppendingString:@": "] stringByAppendingString:value];
                NSLog(@"%@", output);
                
            }
            
            
            FGBuilding* b = [[FGBuilding alloc] initWithJSONData:results];
            rsltKnox.text = [b.accessInfo objectForKey:@"knoxBox_desc"];
            /*
            NSLog(@"%@", b.buildingName);
            
            b.address, b.accessInfo, b.constructionInfo, b.protectionInfo);
             */
            
    
        }
        else{
            rslt.text = @"Not Found";
        }
        
    }
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    addressField.delegate=self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    BOOL a = FALSE;
    if (interfaceOrientation==UIInterfaceOrientationLandscapeLeft || interfaceOrientation==UIInterfaceOrientationLandscapeRight){
        a = TRUE;
    }
	return a;
}

@end
