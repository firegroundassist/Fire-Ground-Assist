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
@synthesize constructionInfoView, contactsView;

- (void) updateCurrentBuilding:(FGBuilding *)building
{
	self.currentBuilding = building;
	rslt.text = [building.buildingName capitalizedString];
	rsltAddress.text = [building.address capitalizedString];
	[self.accessInfoView updateData:building.accessInfo]; 
	[self.protectionInfoView updateData:building.protectionInfo];
	[self.constructionInfoView updateData:building.constructionInfo];
	//[self.contactsView updateData:building.contactInfo];
}

- (IBAction)btnPressed:(UIButton *)button
{
	//converting button name into respective property key
	NSArray* nameParts = [button.titleLabel.text componentsSeparatedByString:@" "];
	NSMutableArray* newNameParts = [nameParts mutableCopy];
	[newNameParts replaceObjectAtIndex:0 withObject:[(NSString*)[nameParts objectAtIndex:0] lowercaseString]];
	NSString* viewName = @"";
	
	for (NSString* currentWord in newNameParts){
		viewName = [viewName stringByAppendingString:currentWord];
	}
	
	NSString* viewNameTwo = [viewName stringByAppendingString:@"InfoView"];
	viewName = [viewName stringByAppendingString:@"View"];
		
	// switching visible view using property key
	@try {
		[self.view addSubview:[self valueForKey:viewName]];
	}
	@catch (NSException *exception) {
		@try {
			[self.view addSubview:[self valueForKey:viewNameTwo]];
		}
		@catch (NSException *exception) {
			return;
		}
	}

}

- (IBAction) findBuilding
{
	rslt.text = @"";
	rsltAddress.text = @"";
	[accessInfoView clearData];
	[protectionInfoView clearData];
	[constructionInfoView clearData];
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
    screen.hidden = FALSE;
    [spinner startAnimating];
    spinner.hidden = FALSE;

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
			UIAlertView* buildingNotFound = [[UIAlertView alloc] 
											 initWithTitle:@"Not Found" 
											 message:@"Building not found" 
											 delegate:nil 
											 cancelButtonTitle:@"Ok" otherButtonTitles: nil];
			[buildingNotFound show];
			[buildingNotFound release];
            rslt.text = @"Not Found";
        }
        screen.hidden = TRUE;
        [spinner stopAnimating];
        spinner.hidden = YES;
        
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

- (void)dealloc
{
    [screen release];
    [super dealloc];
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
	
	// Contact Info
	contactsView = [[FGContactInfoView alloc] initWithFrame:CGRectMake(700, 210, 300, 520)];
	contactsView.backgroundColor = [UIColor darkGrayColor];
	
	// Protection Info
	protectionInfoView = [[FGProtectionInfoView alloc] initWithFrame:CGRectMake(700, 210, 300, 520)];
	protectionInfoView.backgroundColor = [UIColor darkGrayColor];
	
	// Construction Info
	constructionInfoView = [[FGConstructionInfoView alloc] initWithFrame:CGRectMake(700, 210, 300, 520)];
	constructionInfoView.backgroundColor = [UIColor darkGrayColor];
	
	// Access Info
	accessInfoView = [[FGAccessInfoView alloc] initWithFrame:CGRectMake(700, 210, 300, 520)];
	accessInfoView.backgroundColor = [UIColor darkGrayColor];
	[self.view addSubview:accessInfoView];
    
    screen = [[UIView alloc] initWithFrame:self.view.frame];
    screen.backgroundColor = [UIColor blackColor];
    screen.alpha = 0.6f;
    screen.hidden = YES;
    [self.view addSubview:screen];
    
    spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(500, 200, 20, 20)];
    spinner.hidden = YES;
    [self.view addSubview:spinner];
	
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
