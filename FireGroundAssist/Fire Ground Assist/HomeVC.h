//
//  HomeVC.h
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URLRequest.h"
#import "JSON.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "FGBuilding.h"
#import "FGSideInfoView.h"
#import "FGAccessInfoView.h"
#import "FGProtectionInfoView.h"
#import "FGConstructionInfoView.h"
#import "FGContactInfoView.h"

@interface HomeVC : UIViewController <UITextFieldDelegate> {
    URLRequest *req;
    IBOutlet UITextField *addressField;
    IBOutlet UILabel *rslt;
    IBOutlet UILabel *rsltAddress;
    NSMutableArray *previousSearches;
    
    UIView *screen;
    UIActivityIndicatorView *spinner;

}

@property (retain, nonatomic) FGBuilding* currentBuilding;
@property (retain, nonatomic) FGAccessInfoView* accessInfoView;
@property (retain, nonatomic) FGProtectionInfoView* protectionInfoView;
@property (retain, nonatomic) FGConstructionInfoView* constructionInfoView;
@property (retain, nonatomic) FGContactInfoView* contactsView;


- (IBAction) findBuilding;
- (void) updateCurrentBuilding:(FGBuilding*)building;
- (IBAction)btnPressed:(UIButton*)button;

@end
