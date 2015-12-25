//
//  HTMLParser.h
//  StackOverflow
//
//  Created by Ben Reeves on 09/03/2010.
//  Copyright 2010 Ben Reeves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <libxml/HTMLparser.h>
#import "HTMLNode.h"

@class HTMLNode;


#warning add "/usr/include/libxml2"  "header search paths"


/**  demo

 NSError *error = nil;
 NSString *html =
 @"<ul>"
 "<li><input type='image' name='input1' value='string1value' /></li>"
 "<li><input type='image' name='input2' value='string2value' /></li>"
 "</ul>"
 "<span class='spantext'><b>Hello World 1</b></span>"
 "<span class='spantext'><b>Hello World 2</b></span>";
 HTMLParser *parser = [[HTMLParser alloc] initWithString:html error:&error];
 
 if (error) {
 NSLog(@"Error: %@", error);
 return;
 }
 
 HTMLNode *bodyNode = [parser body];
 
 NSArray *inputNodes = [bodyNode findChildTags:@"input"];
 
 for (HTMLNode *inputNode in inputNodes) {
 if ([[inputNode getAttributeNamed:@"name"] isEqualToString:@"input2"]) {
 NSLog(@"%@", [inputNode getAttributeNamed:@"value"]); //Answer to first question
 }
 }
 
 NSArray *spanNodes = [bodyNode findChildTags:@"span"];
 
 for (HTMLNode *spanNode in spanNodes) {
 if ([[spanNode getAttributeNamed:@"class"] isEqualToString:@"spantext"]) {
 NSLog(@"%@", [spanNode rawContents]); //Answer to second question
 }
 }

 


 */


@interface HTMLParser : NSObject
{
	@public
	htmlDocPtr _doc;
}

-(id)initWithContentsOfURL:(NSURL*)url error:(NSError**)error;
-(id)initWithData:(NSData*)data error:(NSError**)error;
-(id)initWithString:(NSString*)string error:(NSError**)error;

//Returns the doc tag
-(HTMLNode*)doc;

//Returns the body tag
-(HTMLNode*)body;

//Returns the html tag
-(HTMLNode*)html;

//Returns the head tag
- (HTMLNode*)head;

@end
