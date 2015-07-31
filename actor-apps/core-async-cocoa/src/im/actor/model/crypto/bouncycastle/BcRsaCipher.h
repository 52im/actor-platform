//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core-crypto/src/main/java/im/actor/model/crypto/bouncycastle/BcRsaCipher.java
//

#ifndef _BCBcRsaCipher_H_
#define _BCBcRsaCipher_H_

#include "J2ObjC_header.h"
#include "im/actor/model/crypto/RsaCipher.h"
#include "im/actor/model/crypto/bouncycastle/BcRsaEncryptCipher.h"

@class IOSByteArray;
@protocol BCRandomProvider;

@interface BCBcRsaCipher : BCBcRsaEncryptCipher < AMRsaCipher >

#pragma mark Public

- (instancetype)initWithBCRandomProvider:(id<BCRandomProvider>)random
                           withByteArray:(IOSByteArray *)publicKey
                           withByteArray:(IOSByteArray *)privateKey;

- (IOSByteArray *)decryptWithByteArray:(IOSByteArray *)sourceData;

@end

J2OBJC_EMPTY_STATIC_INIT(BCBcRsaCipher)

FOUNDATION_EXPORT void BCBcRsaCipher_initWithBCRandomProvider_withByteArray_withByteArray_(BCBcRsaCipher *self, id<BCRandomProvider> random, IOSByteArray *publicKey, IOSByteArray *privateKey);

FOUNDATION_EXPORT BCBcRsaCipher *new_BCBcRsaCipher_initWithBCRandomProvider_withByteArray_withByteArray_(id<BCRandomProvider> random, IOSByteArray *publicKey, IOSByteArray *privateKey) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(BCBcRsaCipher)

typedef BCBcRsaCipher ImActorModelCryptoBouncycastleBcRsaCipher;

#endif // _BCBcRsaCipher_H_
