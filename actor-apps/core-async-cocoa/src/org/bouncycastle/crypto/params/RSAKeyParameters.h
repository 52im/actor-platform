//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core-crypto/src/main/java/org/bouncycastle/crypto/params/RSAKeyParameters.java
//

#ifndef _OrgBouncycastleCryptoParamsRSAKeyParameters_H_
#define _OrgBouncycastleCryptoParamsRSAKeyParameters_H_

#include "J2ObjC_header.h"
#include "org/bouncycastle/crypto/params/AsymmetricKeyParameter.h"

@class JavaMathBigInteger;

@interface OrgBouncycastleCryptoParamsRSAKeyParameters : OrgBouncycastleCryptoParamsAsymmetricKeyParameter

#pragma mark Public

- (instancetype)initWithBoolean:(jboolean)isPrivate
         withJavaMathBigInteger:(JavaMathBigInteger *)modulus
         withJavaMathBigInteger:(JavaMathBigInteger *)exponent;

- (JavaMathBigInteger *)getExponent;

- (JavaMathBigInteger *)getModulus;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleCryptoParamsRSAKeyParameters)

FOUNDATION_EXPORT void OrgBouncycastleCryptoParamsRSAKeyParameters_initWithBoolean_withJavaMathBigInteger_withJavaMathBigInteger_(OrgBouncycastleCryptoParamsRSAKeyParameters *self, jboolean isPrivate, JavaMathBigInteger *modulus, JavaMathBigInteger *exponent);

FOUNDATION_EXPORT OrgBouncycastleCryptoParamsRSAKeyParameters *new_OrgBouncycastleCryptoParamsRSAKeyParameters_initWithBoolean_withJavaMathBigInteger_withJavaMathBigInteger_(jboolean isPrivate, JavaMathBigInteger *modulus, JavaMathBigInteger *exponent) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleCryptoParamsRSAKeyParameters)

#endif // _OrgBouncycastleCryptoParamsRSAKeyParameters_H_
