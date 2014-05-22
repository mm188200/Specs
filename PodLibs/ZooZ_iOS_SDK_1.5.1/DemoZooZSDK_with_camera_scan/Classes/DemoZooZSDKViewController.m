//
//  DemoZooZSDKViewController.m
//  DemoZooZSDK
//
//  Created by Ronen Morecki on 10/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DemoZooZSDKViewController.h"


#define IS_SANDBOX YES

@implementation DemoZooZSDKViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    //optional pre init, so the ZooZ screen will upload immediatly, you can skip this call
    ZooZ * zooz = [ZooZ sharedInstance];
    [zooz preInitialize:@"951bde04-5a26-4200-a94e-34d775a1e5f9" isSandboxEnv:IS_SANDBOX withCurrencyCode:@"USD"];

}

-(IBAction)buyMore{
	paymentSuccessLabel.hidden = YES;
	
	ZooZ * zooz = [ZooZ sharedInstance];
    
    zooz.sandbox = IS_SANDBOX;
    
    zooz.tintColor = [UIColor colorWithRed:1 green:0.8 blue:0 alpha:1];
    
    zooz.barButtonTintColor = [UIColor darkGrayColor];
    
    zooz.autoOpenScanWithCamera = NO;
    
    //optional image that will be displayed on the NavigationBar as your logo
//    zooz.barTitleImage = [UIImage imageNamed:@"MyLogo.png"];
    
    ZooZPaymentRequest * req = [zooz createPaymentRequestWithTotal:5 invoiceRefNumber:@"test invoice ref-1234" delegate:self];
    
    /*
    //If you want only to allow regsiter cards and not do payment use this instead of the above:
    ZooZPaymentRequest * req = [zooz createManageFundSourcesRequestWithDelegate:self];
    */
    
    req.currencyCode = @"USD";
    
    req.payerDetails.firstName = @"Marina";
    
    req.payerDetails.email = @"john@gmail.com"; //optional
    
    req.payerDetails.billingAddress.zipCode=@"01234";
    
    req.requireAddress = NO; //set if to ask for zip code or not from the payer.
    
    ZooZInvoiceItem * item = [ZooZInvoiceItem invoiceItem:12.1 quantity:1 name:@"T-Shirt"];
    item.additionalDetails = @"Free 200 characters custom description";
    item.itemId = @"refId-12345678"; // optional
    
    [req addItem:item];
    
    req.invoice.additionalDetails = @"Custom invoice description text";
        
    [zooz openPayment:req forAppKey:@"951bde04-5a26-4200-a94e-34d775a1e5f9"];
    
}


-(IBAction)registerCards{
    paymentSuccessLabel.hidden = YES;
	
	ZooZ * zooz = [ZooZ sharedInstance];
    
    zooz.sandbox = IS_SANDBOX;
    
    zooz.tintColor = [UIColor colorWithRed:1 green:0.8 blue:0 alpha:1];
    
    zooz.barButtonTintColor = [UIColor darkGrayColor];
    
    zooz.autoOpenScanWithCamera = NO;
    
    //optional image that will be displayed on the NavigationBar as your logo
    //    zooz.barTitleImage = [UIImage imageNamed:@"MyLogo.png"];
    
    ZooZPaymentRequest * req = [zooz createManageFundSourcesRequestWithDelegate:self];
    
    /*
     //If you want only to allow regsiter cards and not do payment use this instead of the above:
     ZooZPaymentRequest * req = [zooz createManageFundSourcesRequestWithDelegate:self];
     */
    
    req.currencyCode = @"USD";
    
    req.payerDetails.firstName = @"John";
    
    req.payerDetails.email = @"John@gmail.com";
    
    req.requireAddress = NO; //set if to ask for zip code or not from the payer.
    
    
    [zooz openPayment:req forAppKey:@"951bde04-5a26-4200-a94e-34d775a1e5f9"];
    
}


- (void)openPaymentRequestFailed:(ZooZPaymentRequest *)request withErrorCode:(int)errorCode andErrorMessage:(NSString *)errorMessage{
	NSLog(@"failed: %@", errorMessage);
    //this is a network / integration failure, not a payment processing failure.
	
}

//Called in the background thread - before user closes the payment dialog
//Do not refresh UI at this callback - see paymentSuccessDialogClosed
- (void)paymentSuccessWithResponse:(ZooZPaymentResponse *)response{
    
	NSLog(@"payment success with payment Id: %@, %@, %@, %f %@", response.transactionDisplayID, response.fundSourceType, response.lastFourDigits, response.paidAmount, response.transactionID);
}

//called after successful payment and after the user closed the payment dialog
//Do the UI changes on success at this point
-(void)paymentSuccessDialogClosed{
    NSLog(@"Payment dialog closed after success");
    //see paymentSuccessWithResponse: for the response transaction ID. 
   	paymentSuccessLabel.hidden = NO;
}

- (void)paymentCanceled{
	NSLog(@"payment cancelled");
    //dialog closed without payment completed
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}



- (void)dealloc {
	[paymentSuccessLabel release];
    [super dealloc];
}

@end
