//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core-crypto/src/main/java/org/bouncycastle/util/Integers.java
//


#include "J2ObjC_source.h"
#include "java/lang/Integer.h"
#include "org/bouncycastle/util/Integers.h"

@implementation OrgBouncycastleUtilIntegers

+ (jint)rotateLeftWithInt:(jint)i
                  withInt:(jint)distance {
  return OrgBouncycastleUtilIntegers_rotateLeftWithInt_withInt_(i, distance);
}

+ (jint)rotateRightWithInt:(jint)i
                   withInt:(jint)distance {
  return OrgBouncycastleUtilIntegers_rotateRightWithInt_withInt_(i, distance);
}

+ (JavaLangInteger *)valueOfWithInt:(jint)value {
  return OrgBouncycastleUtilIntegers_valueOfWithInt_(value);
}

- (instancetype)init {
  OrgBouncycastleUtilIntegers_init(self);
  return self;
}

@end

jint OrgBouncycastleUtilIntegers_rotateLeftWithInt_withInt_(jint i, jint distance) {
  OrgBouncycastleUtilIntegers_initialize();
  return JavaLangInteger_rotateLeftWithInt_withInt_(i, distance);
}

jint OrgBouncycastleUtilIntegers_rotateRightWithInt_withInt_(jint i, jint distance) {
  OrgBouncycastleUtilIntegers_initialize();
  return JavaLangInteger_rotateRightWithInt_withInt_(i, distance);
}

JavaLangInteger *OrgBouncycastleUtilIntegers_valueOfWithInt_(jint value) {
  OrgBouncycastleUtilIntegers_initialize();
  return JavaLangInteger_valueOfWithInt_(value);
}

void OrgBouncycastleUtilIntegers_init(OrgBouncycastleUtilIntegers *self) {
  (void) NSObject_init(self);
}

OrgBouncycastleUtilIntegers *new_OrgBouncycastleUtilIntegers_init() {
  OrgBouncycastleUtilIntegers *self = [OrgBouncycastleUtilIntegers alloc];
  OrgBouncycastleUtilIntegers_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleUtilIntegers)
