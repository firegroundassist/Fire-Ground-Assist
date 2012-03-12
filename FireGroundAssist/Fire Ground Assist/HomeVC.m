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

@synthesize currentBuilding;
@synthesize accessInfoView;
@synthesize protectionInfoView;

- (void) updateCurrentBuilding:(FGBuilding *)building
{
	self.currentBuilding = building;
	rslt.text = [building.buildingName capitalizedString];
	rsltAddress.text = [building.address capitalizedString];
	[self.accessInfoView updateData:building.accessInfo]; 

}

- (IBAction)btnPressed:(UIButton *)button
{
	accessInfoView.titleLabel.text = button.titleLabel.text;
	[accessInfoView clearData];
	if (button.tag==1000) {
		[self updateCurrentBuilding:self.currentBuilding];
	}

}

- (IBAction) findBuilding
{
	rslt.text = @"";
	rsltAddress.text = @"";
	[accessInfoView clearData];
    [addressField resignFirstResponder]; 
    NSString *addr = [addressField.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *url = [NSString stringWithFormat:@"http://www.firegroundassist.com/building?address=%@", addr];
    //NSLog(@"findBuilding: %@", url);
    
    [previousSearches addObject:addressField.text];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:previousSearches forKey:@"saved"];
    [defaults synchronize];

    
    
    if (req!=nil){ req.delegate =nil; [req release]; req = nil; }
    req = [[URLRequest alloc] initWithAddress:url parameters:nil];
    req.delegate = self;
    [req setHttpMethod:@"GET"];
    [req sendRequest];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField              // called when 'return' key pressed. return NO to ignore.
{
    [textField resignFirstResponder];
	[self findBuilding];
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
//            NSArray *accessInfo = [results objectForKey:@"access info"];
//            for (NSString *a in accessInfo) {
//                NSArray *components = [a componentsSeparatedByString:@"=="];
//                NSString *paramter = [components objectAtIndex:0];
//                NSString *value = [components objectAtIndex:1];
//                NSString *output = [[paramter stringByAppendingString:@": "] stringByAppendingString:value];
//                NSLog(@"%@", output);
//                
//            }
            
            [self updateCurrentBuilding:[[FGBuilding alloc] initWithJSONData:results]];
            
    
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
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSArray *saved = [defaults objectForKey:@"saved"];
        if (saved==nil){
            previousSearches = [[NSMutableArray alloc] init];
        }
        else{
            previousSearches = [[NSMutableArray alloc] initWithArray:saved];
        }
        NSLog(@"SAVED: %@", [previousSearches description]);
             
        
        
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
	
	// Access Info
	accessInfoView = [[FGAccessInfoView alloc] initWithFrame:CGRectMake(700, 210, 300, 520)];
	accessInfoView.backgroundColor = [UIColor darkGrayColor];
	[self.view addSubview:accessInfoView];
	
	// Protection Info
	protectionInfoView = [[FGProtectionInfoView alloc] initWithFrame:CGRectMake(450, 210, 300, 520)];
	protectionInfoView.backgroundColor = [UIColor darkGrayColor];
	[self.view addSubview:protectionInfoView];
	
	
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
