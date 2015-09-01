//
//  NSData+Extension.m
//  Universal
//
//  Created by Code on 15/9/2.
//  Copyright (c) 2015年 emiaobao. All rights reserved.
//

#import "NSData+Extension.h"

#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (Extension)

- (NSData*)AESEncryptWithKey:(NSString*)key size:(size_t)size
{
    NSUInteger dataLength = [self length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          
                                          kCCOptionPKCS7Padding/*这里就是刚才说到的PKCS7Padding填充了*/| kCCOptionECBMode,
                                          
                                          [self bytes], kCCKeySizeAES128,
                                          
                                          NULL,/* 初始化向量(可选) */
                                          
                                          [self bytes], dataLength,/*输入*/
                                          
                                          buffer, bufferSize,/* 输出 */
                                          
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        
    }
    
    free(buffer);//释放buffer
    
    return nil;

}

- (NSData*)AES128EncryptWithKey:(NSString*)key
{
    return [self AESEncryptWithKey:key size:kCCAlgorithmAES128];
}
- (NSData*)AES256EncryptWithKey:(NSString*)key
{
    return [self AESEncryptWithKey:key size:kCCKeySizeAES256];
}

- (NSData*)AESDecryptWithKey:(NSString*)key size:(size_t)size
{
    //同理，解密中，密钥也是32位的
    
    const void * keyPtr2 = [self bytes];
    
    const char (*keyPtr)[size] = keyPtr2;
    
    //对于块加密算法，输出大小总是等于或小于输入大小加上一个块的大小
    
    //所以在下边需要再加上一个块的大小
    
    NSUInteger dataLength = [self length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          
                                          kCCOptionPKCS7Padding/*这里就是刚才说到的PKCS7Padding填充了*/| kCCOptionECBMode,
                                          
                                          keyPtr, size,
                                          
                                          NULL,/* 初始化向量(可选) */
                                          
                                          [self bytes], dataLength,/* 输入 */
                                          
                                          buffer, bufferSize,/* 输出 */
                                          
                                          &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess) {
        
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        
    }
    
    free(buffer);
    
    return nil;

}

- (NSData*)AES128DecryptWithKey:(NSString*)key
{
    return [self AESDecryptWithKey:key size:kCCKeySizeAES128];
}

- (NSData*)AES256DecryptWithKey:(NSString*)key;
{
    return [self AESDecryptWithKey:key size:kCCKeySizeAES256];
}

@end
