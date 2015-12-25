//
//  AttributedLabelURL.m
//  Universal
//
//  Created by 杜晓星 on 15/12/24.
//  Copyright © 2015年 emiaobao. All rights reserved.
//

#import "AttributedLabelURL.h"
#import "HTMLParser.h"

static NSString *urlExpression = @"((([A-Za-z]{3,9}:(?:\\/\\/)?)(?:[\\-;:&=\\+\\$,\\w]+@)?[A-Za-z0-9\\.\\-]+|(?:www\\.|[\\-;:&=\\+\\$,\\w]+@)[A-Za-z0-9\\.\\-]+)((:[0-9]+)?)((?:\\/[\\+~%\\/\\.\\w\\-]*)?\\??(?:[\\-\\+=&;%@\\.\\w]*)#?(?:[\\.\\!\\/\\\\\\w]*))?)";

static AttributedLabelURLBlock customDetectBlock = nil;

@implementation AttributedLabelURL

+ (AttributedLabelURL *)urlWithLinkData: (id)linkData
                                     range: (NSRange)range
                                     color: (UIColor *)color
{
    AttributedLabelURL *url  = [[AttributedLabelURL alloc]init];
    url.linkData                = linkData;
    url.range                   = range;
    url.color                   = color;
    return url;
    
}


+ (NSArray *)detectLinks: (NSString *)plainText
{
    //提供一个自定义的解析接口给
    if (customDetectBlock)
    {
        return customDetectBlock(plainText);
    }
    else
    {
        NSMutableArray *links = nil;
        if ([plainText length])
        {
            links = [NSMutableArray array];
            NSRegularExpression *urlRegex = [NSRegularExpression regularExpressionWithPattern:urlExpression
                                                                                      options:NSRegularExpressionCaseInsensitive
                                                                                        error:nil];
            [urlRegex enumerateMatchesInString:plainText
                                       options:0
                                         range:NSMakeRange(0, [plainText length])
                                    usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                                        NSRange range = result.range;
                                        NSString *text = [plainText substringWithRange:range];
                                        AttributedLabelURL *link = [AttributedLabelURL urlWithLinkData:text
                                                                                                       range:range
                                                                                                       color:nil];
                                        [links addObject:link];
                                    }];
        }
        return links;
    }
}

/**
 *  <a href='http://www.baidu.com'>百度一下</a>
 *
 *  @param htmlString <#htmlString description#>
 *
 *  @return <#return value description#>
 */

+ (AttributedLabelURL*)mutableAttributeStringWithHtmlString:(NSString*)htmlString
{
    NSError *error = nil;
    
    HTMLParser *parser = [[HTMLParser alloc] initWithString:htmlString error:&error];
    
    if (error) {
        NSLog(@"Error: %@", error);
        return nil;
    }
    else
    {   HTMLNode *bodyNode = [parser body];
        
        NSArray *inputNodes = [bodyNode findChildTags:@"a"];
        
        HTMLNode *inputNode = [inputNodes firstObject];
        NSString *href = [inputNode getAttributeNamed:@"href"];
        NSString *content = [inputNode contents];
        
        NSRange htmlRange;
        if(content)
        {
            htmlRange = NSMakeRange(0, content.length);
        }
        else
        {
            htmlRange = NSMakeRange(0, href.length);
        }
        
        AttributedLabelURL *url = [AttributedLabelURL urlWithLinkData:content?content:href range:htmlRange color:[UIColor blueColor]];
        
          return url;
    }
  
}
+ (AttributedLabelURL*)mutableAttributeStringWithFullString:(NSString *)fullString;
{
    NSString *htmlString = [self htmlStringWithFullString:fullString];
    if (htmlString) {
        
        return [self mutableAttributeStringWithHtmlString:htmlString];
    }
    else
    {
        return nil;
    }
    
}
/**
 *  解析 htmlString
 *
 *  @param fullStirng <#fullStirng description#>
 *
 *  @return <#return value description#>
 */
+ (NSString*)htmlStringWithFullString:(NSString*)fullStirng
{
    NSRange startRange = [fullStirng rangeOfString:@"<a"];
    NSRange endRange = [fullStirng rangeOfString:@"</a>"];
    
    NSRange contentRange = NSMakeRange(startRange.location, endRange.location - endRange.length);
    
    NSString *htmlString = [fullStirng substringWithRange:contentRange];
    
    return htmlString;
}

//+ (void)setCustomDetectMethod:(AttributedLabelURLBlock)block
//{
//    customDetectBlock = [block copy];
//}

@end
