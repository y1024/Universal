//
//  NSData+Extension.h
//  Universal
//
//  Created by Code on 15/9/2.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Extension)

/**
 *  AES 加密
 *
 *  @param key  <#key description#>
 *  @param size <#size description#>
 *
 *  @return <#return value description#>
 */
- (NSData*)AESEncryptWithKey:(NSString*)key size:(size_t)size;

- (NSData*)AES128EncryptWithKey:(NSString*)key;

- (NSData*)AES256EncryptWithKey:(NSString*)key;

/**
 *  AES 解密
 *
 *  @param key  <#key description#>
 *  @param size <#size description#>
 *
 *  @return <#return value description#>
 */
- (NSData*)AESDecryptWithKey:(NSString*)key size:(size_t)size;

- (NSData*)AES128DecryptWithKey:(NSString*)key;

- (NSData*)AES256DecryptWithKey:(NSString*)key;

@end
