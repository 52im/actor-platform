//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core-crypto/src/main/java/org/bouncycastle/crypto/params/RSAKeyParameters.java
//


#include "J2ObjC_source.h"
#include "java/math/BigInteger.h"
#include "org/bouncycastle/crypto/params/AsymmetricKeyParameter.h"
#include "org/bouncycastle/crypto/params/RSAKeyParameters.h"

@interface OrgBouncycastleCryptoParamsRSAKeyParameters () {
 @public
  JavaMathBigInteger *modulus_;
  JavaMathBigInteger *exponent_;
}

@end

J2OBJC_FIELD_SETTER(OrgBouncycastleCryptoParamsRSAKeyParameters, modulus_, JavaMathBigInteger *)
J2OBJC_FIELD_SETTER(OrgBouncycastleCryptoParamsRSAKeyParameters, exponent_, JavaMathBigInteger *)

@implementation OrgBouncycastleCryptoParamsRSAKeyParameters

- (instancetype)initWithBoolean:(jboolean)isPrivate
         withJavaMathBigInteger:(JavaMathBigInteger *)modulus
         withJavaMathBigInteger:(JavaMathBigInteger *)exponent {
  OrgBouncycastleCryptoParamsRSAKeyParameters_initWithBoolean_withJavaMathBigInteger_withJavaMathBigInteger_(self, isPrivate, modulus, exponent);
  return self;
}

- (JavaMathBigInteger *)getModulus {
  return modulus_;
}

- (JavaMathBigInteger *)getExponent {
  return exponent_;
}

@end

void OrgBouncycastleCryptoParamsRSAKeyParameters_initWithBoolean_withJavaMathBigInteger_withJavaMathBigInteger_(OrgBouncycastleCryptoParamsRSAKeyParameters *self, jboolean isPrivate, JavaMathBigInteger *modulus, JavaMathBigInteger *exponent) {
  (void) OrgBouncycastleCryptoParamsAsymmetricKeyParameter_initWithBoolean_(self, isPrivate);
  self->modulus_ = modulus;
  self->exponent_ = exponent;
}

OrgBouncycastleCryptoParamsRSAKeyParameters *new_OrgBouncycastleCryptoParamsRSAKeyParameters_initWithBoolean_withJavaMathBigInteger_withJavaMathBigInteger_(jboolean isPrivate, JavaMathBigInteger *modulus, JavaMathBigInteger *exponent) {
  OrgBouncycastleCryptoParamsRSAKeyParameters *self = [OrgBouncycastleCryptoParamsRSAKeyParameters alloc];
  OrgBouncycastleCryptoParamsRSAKeyParameters_initWithBoolean_withJavaMathBigInteger_withJavaMathBigInteger_(self, isPrivate, modulus, exponent);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleCryptoParamsRSAKeyParameters)
