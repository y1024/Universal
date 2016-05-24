//
//  CocoaSecurity+AES.m
//  Universal
//
//  Created by 杜晓星 on 16/5/24.
//  Copyright © 2016年 emiaobao. All rights reserved.
//

#import "CocoaSecurity+AES.h"

@implementation CocoaSecurity (AES)

+ (NSString *)encryAESWithSrc:(NSString *)src
			  key:(NSString *)keyString
		     ivString:(NSString *)ivString {
	NSString *keyHexString = [self hexASIIWithString:keyString];
	NSString *ivHexString = [self hexASIIWithString:ivString];
	CocoaSecurityDecoder *keyHexDecoder = [CocoaSecurityDecoder new];

	NSData *keyHexStringData = [keyHexDecoder hex:keyHexString];
	NSData *ivHexStringData = [keyHexDecoder hex:ivHexString];

	NSData *encryptKeyHexStringData =
	    [keyHexStringData subdataWithRange:NSMakeRange(0, 16)];
	NSData *encryptIvHexStringData =
	    [ivHexStringData subdataWithRange:NSMakeRange(0, 16)];
	CocoaSecurityResult *encryptResult =
	    [CocoaSecurity aesEncrypt:src
				  key:encryptKeyHexStringData
				   iv:encryptIvHexStringData];
	return encryptResult.base64;
}

+ (NSString *)hexASIIWithString:(NSString *)string {
	NSString *iv = @"";
	for (int i = 0; i < string.length; i++) {
		iv = [iv stringByAppendingString:
			     [NSString
				 stringWithFormat:@"%x",
						  [string characterAtIndex:i]]];
	};
	return iv;
}

+ (NSString*)dencryAESWithSrc:(NSString*)src key:(NSString*)keyString ivString:(NSString*)ivString {
    NSString *keyHexString = [self hexASIIWithString:keyString];
    NSString *ivHexString = [self hexASIIWithString:ivString];
    CocoaSecurityDecoder *keyHexDecoder = [CocoaSecurityDecoder new];
    
    NSData *keyHexStringData = [keyHexDecoder hex:keyHexString];
    NSData *ivHexStringData = [keyHexDecoder hex:ivHexString];
    
    NSData *encryptKeyHexStringData =
    [keyHexStringData subdataWithRange:NSMakeRange(0, 16)];
    NSData *encryptIvHexStringData =
    [ivHexStringData subdataWithRange:NSMakeRange(0, 16)];
    CocoaSecurityResult *decryptResult = [CocoaSecurity aesDecryptWithBase64:src key:encryptKeyHexStringData iv:encryptIvHexStringData];
    return decryptResult.utf8String;
}




@end
