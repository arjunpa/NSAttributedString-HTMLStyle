//
//  QRViewController.m
//  NSAttributedString+HTMLStyle
//
//  Created by Wojciech Czekalski on 23.03.2014.
//  Copyright (c) 2014 Wojciech Czekalski. All rights reserved.
//

#import "QRViewController.h"
#import "NSAttributedString+HTMLStyle.h"

@interface QRViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextView *customTextView;
@end

@implementation QRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSData *unformattedData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HTML" ofType:@"html"]];
 
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [paragraphStyle setLineHeightMultiple:4.f];
    
    [attributes addAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Helvetica" size:20.f], NSParagraphStyleAttributeName : paragraphStyle} forHTMLAttribute:QRHTMLAttributeStrong flatten:YES];
    [attributes addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:17.f]} forHTMLAttribute:QRHTMLAttributeParagraph flatten:YES];
    
   
    
    NSData *htmlData = [unformattedData dataByReplacingOccurrencesOfData:[@"\\n" dataUsingEncoding:NSUTF8StringEncoding] withData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSAttributedString *attributedString = [NSAttributedString attributedStringFromHTMLData:unformattedData];

    
    self.textView.attributedText = attributedString;
    
    self.customTextView.attributedText = [NSAttributedString attributedStringFromHTMLData:htmlData attributes:attributes];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
