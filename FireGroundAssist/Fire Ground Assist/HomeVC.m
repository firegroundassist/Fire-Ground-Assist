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
@synthesize constructionInfoView, contactsView, map;

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
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[self valueForKey:viewName] cache:YES];
		[UIView setAnimationDuration:1];
		[self.view addSubview:[self valueForKey:viewName]];
		[UIView commitAnimations];
	}
	@catch (NSException *exception) {
		@try {
			[UIView beginAnimations:nil context:NULL];
			[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[self valueForKey:viewNameTwo] cache:YES];
			[UIView setAnimationDuration:1];
			[self.view addSubview:[self valueForKey:viewNameTwo]];
			[UIView commitAnimations];
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
	sideInfoX = 645;
	sideInfoY = 210;
	sideInfoWidth = 320;
	sideInfoHeight = 520;
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
	CLLocationCoordinate2D loc = CLLocationCoordinate2DMake(40.88787210, -73.96411739999999);
	MKCoordinateRegion reg = MKCoordinateRegionMakeWithDistance(loc, 500, 500);
	map.region = reg;
	MKPointAnnotation* ann = [[MKPointAnnotation alloc] init];
	ann.coordinate = loc;
	ann.title = @"Dwight-Englewood";
	ann.subtitle = @"315 East Palisades Ave";
	[map addAnnotation:ann];
	[ann release];
	map.hidden = NO;
	
	CGRect sideInfoFrame = CGRectMake(sideInfoX, sideInfoY, sideInfoWidth, sideInfoHeight);
    
    // Do any additional setup after loading the view from its nib.
    addressField.delegate=self;
	
	// Contact Info
	contactsView = [[FGContactInfoView alloc] initWithFrame:sideInfoFrame];
	contactsView.backgroundColor = [UIColor darkGrayColor];
	
	// Protection Info
	protectionInfoView = [[FGProtectionInfoView alloc] initWithFrame:sideInfoFrame];
	protectionInfoView.backgroundColor = [UIColor darkGrayColor];
	
	// Construction Info
	constructionInfoView = [[FGConstructionInfoView alloc] initWithFrame:sideInfoFrame];
	constructionInfoView.backgroundColor = [UIColor darkGrayColor];
	
	// Access Info
	accessInfoView = [[FGAccessInfoView alloc] initWithFrame:sideInfoFrame];
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
	
	// Rotated Navigation Bar
	UIView* navBar = [[UIView alloc] initWithFrame:CGRectMake(970, 200, 50, 520)];
	navBar.backgroundColor = [UIColor lightGrayColor];
	NSArray* navBarTitles = [NSArray arrayWithObjects:@"Main", @"Access", @"Hydrants", @"Construction", @"Protection", @"Contacts", nil];
	int xPos = 1;
	
	for (int i = 0; i<navBarTitles.count; i++) {
	
		UIView* tabOne = [[UIView alloc] initWithFrame:CGRectMake(5, xPos, 40, 90)];
		tabOne.backgroundColor = [UIColor darkGrayColor];
		CATextLayer* t = [[CATextLayer alloc] init];
		t.string = [navBarTitles objectAtIndex:i];
		t.bounds = CGRectMake(0, 0, tabOne.frame.size.height-10, 2*tabOne.frame.size.width/3.0-10);
		//t.backgroundColor = [[UIColor blueColor] CGColor];
		t.position = CGPointMake(t.bounds.size.height+5, 5);
		t.fontSize = 14.0;
		t.alignmentMode = kCAAlignmentCenter;
		t.wrapped = YES;
		
		t.anchorPoint = CGPointMake(0, 0);
		[t setAffineTransform:CGAffineTransformMakeRotation(M_PI/2.0)];
		[tabOne.layer addSublayer:t];
		[t release];
		 
		[navBar addSubview:tabOne];
		[tabOne release];
		
		xPos +=91;
		CGRect f = navBar.frame;
		f.size.height=xPos;
		navBar.frame = f;
	}
	
	[self.view addSubview:navBar];
	[navBar release];
	
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
