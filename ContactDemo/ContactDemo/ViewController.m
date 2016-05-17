//
//  ViewController.m
//  ContactDemo
//
//  Created by devashish on 13/05/2016.
//  Copyright © 2016 Marvel. All rights reserved.
//

@import Contacts;
@import ContactsUI;

#import "ViewController.h"

@interface ViewController ()<CNContactPickerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{

    self.personImage.layer.cornerRadius = self.personImage.frame.size.width/2;
    self.personImage.layer.masksToBounds = YES;
    
}

- (IBAction)selectAction:(id)sender {
    
    CNContactPickerViewController *contactPicker = [CNContactPickerViewController new];
    contactPicker.delegate = self;
    [self presentViewController:contactPicker animated:YES completion:nil];
    
}

-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact
{
    [self getContactDetails:contact];
}

-(void)getContactDetails:(CNContact *)contactObject
{

/*  ALL DATA SHOULD BE CHECKED BEFORE USE. ASSIGN @"" IF NOT PRESENT ELSE IT WILL RETURN NULL  */
    

    
/*  YOU CAN CHOOSE ANY OF THESE OR COMBINATION OF THAT    */
    
    NSLog(@"NAME PREFIX :: %@",contactObject.namePrefix);
    NSLog(@"NAME SUFFIX :: %@",contactObject.nameSuffix);
    NSLog(@"FAMILY NAME :: %@",contactObject.familyName);
    NSLog(@"GIVEN NAME  :: %@",contactObject.givenName);
    NSLog(@"MIDDLE NAME :: %@",contactObject.middleName);
    
//    NSString * fullName = contactObject.familyName;
    
    NSString * fullName = [NSString stringWithFormat:@"%@ %@",contactObject.givenName,contactObject.familyName];
    
    [self.personName setText:fullName];
    
/*   CONTACT'S PERSON IMAGE IS IN NSDATA FORM   */
    
/*   "contactObject.thumbnailImageData" CAN BE USED  */
    
    if(contactObject.imageData)
    {
        NSData * imageData = (NSData *)contactObject.imageData;
        UIImage * contactImage = [[UIImage alloc] initWithData:imageData];
        [self.personImage setImage:contactImage];
    }
    
/*   BOOL imageDataAvailable : TO CHECK WHETHER IMAGE IS PRESENT OR NOT */
    
/*    "contactObject.phoneNumbers" IS AN ARRAY OF ALL CONTACT NUMBERS OF SELECTED CONTACT   */
    
    NSString * phone = @"";
    NSString * userPHONE_NO = @"";
    
    for(CNLabeledValue * phonelabel in contactObject.phoneNumbers)
    {
        CNPhoneNumber * phoneNo = phonelabel.value;
        phone = [phoneNo stringValue];
        if (phone)
        {
            userPHONE_NO = phone;  /*   MANIPULATE AS PER REQUIREMENT    */
        }
    }
    

/*    "contactObject.emailAddresses" IS AN ARRAY OF ALL CONTACT EMAIL IDs OF SELECTED CONTACT    */
    
    NSString * email = @"";
    NSString * userEMAIL_ID = @"";
    
    for(CNLabeledValue * emaillabel in contactObject.emailAddresses)
    {
        email = emaillabel.value;
        if (email)
        {
            userEMAIL_ID = email;   /*  MANIPULATE AS PER REQUIREMENT   */
        }
    }
    
    NSLog(@"PHONE NO :: %@",userPHONE_NO);
    NSLog(@"EMAIL ID :: %@",userEMAIL_ID);
    
    [self.emailId setText:userEMAIL_ID];
    [self.phoneNo setText:userPHONE_NO];
    
}


@end
