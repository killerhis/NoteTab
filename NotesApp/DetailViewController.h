//
//  DetailViewController.h
//  NotesApp
//
//  Created by Hicham Chourak on 09/07/14.
//  Copyright (c) 2014 Hicham Chourak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface DetailViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property(weak, nonatomic) IBOutlet UITextView *tView;
- (IBAction)sendEmail:(id)sender;


@end
