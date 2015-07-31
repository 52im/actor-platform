//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/util/Base64Utils.java
//


#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/util/Base64Utils.h"
#include "java/lang/StringBuilder.h"

@interface AMBase64Utils ()

+ (jboolean)base64AppendWithJavaLangStringBuilder:(JavaLangStringBuilder *)sb
                                          withInt:(jint)digit
                                      withBoolean:(jboolean)haveNonZero;

@end

static IOSCharArray *AMBase64Utils_base64Chars_;
J2OBJC_STATIC_FIELD_GETTER(AMBase64Utils, base64Chars_, IOSCharArray *)

static IOSByteArray *AMBase64Utils_base64Values_;
J2OBJC_STATIC_FIELD_GETTER(AMBase64Utils, base64Values_, IOSByteArray *)

__attribute__((unused)) static jboolean AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(JavaLangStringBuilder *sb, jint digit, jboolean haveNonZero);

J2OBJC_INITIALIZED_DEFN(AMBase64Utils)

@implementation AMBase64Utils

+ (IOSByteArray *)fromBase64WithNSString:(NSString *)data {
  return AMBase64Utils_fromBase64WithNSString_(data);
}

+ (jlong)longFromBase64WithNSString:(NSString *)value {
  return AMBase64Utils_longFromBase64WithNSString_(value);
}

+ (NSString *)toBase64WithByteArray:(IOSByteArray *)data {
  return AMBase64Utils_toBase64WithByteArray_(data);
}

+ (NSString *)toBase64WithLong:(jlong)value {
  return AMBase64Utils_toBase64WithLong_(value);
}

+ (jboolean)base64AppendWithJavaLangStringBuilder:(JavaLangStringBuilder *)sb
                                          withInt:(jint)digit
                                      withBoolean:(jboolean)haveNonZero {
  return AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, digit, haveNonZero);
}

- (instancetype)init {
  AMBase64Utils_init(self);
  return self;
}

+ (void)initialize {
  if (self == [AMBase64Utils class]) {
    AMBase64Utils_base64Chars_ = [IOSCharArray newArrayWithChars:(jchar[]){ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/' } count:64];
    AMBase64Utils_base64Values_ = [IOSByteArray newArrayWithLength:128];
    {
      for (jint i = 0; i < AMBase64Utils_base64Chars_->size_; i++) {
        *IOSByteArray_GetRef(AMBase64Utils_base64Values_, IOSCharArray_Get(AMBase64Utils_base64Chars_, i)) = (jbyte) i;
      }
    }
    J2OBJC_SET_INITIALIZED(AMBase64Utils)
  }
}

@end

IOSByteArray *AMBase64Utils_fromBase64WithNSString_(NSString *data) {
  AMBase64Utils_initialize();
  if (data == nil) {
    return nil;
  }
  jint len = ((jint) [((NSString *) nil_chk(data)) length]);
  NSCAssert((len % 4) == 0, @"im/actor/model/util/Base64Utils.java:67 condition failed: assert (len % 4) == 0;");
  if (len == 0) {
    return [IOSByteArray newArrayWithLength:0];
  }
  IOSCharArray *chars = [IOSCharArray newArrayWithLength:len];
  [data getChars:0 sourceEnd:len destination:chars destinationBegin:0];
  jint olen = 3 * (len / 4);
  if (IOSCharArray_Get(chars, len - 2) == '=') {
    --olen;
  }
  if (IOSCharArray_Get(chars, len - 1) == '=') {
    --olen;
  }
  IOSByteArray *bytes = [IOSByteArray newArrayWithLength:olen];
  jint iidx = 0;
  jint oidx = 0;
  while (iidx < len) {
    jint c0 = IOSByteArray_Get(nil_chk(AMBase64Utils_base64Values_), IOSCharArray_Get(chars, iidx++) & (jint) 0xff);
    jint c1 = IOSByteArray_Get(AMBase64Utils_base64Values_, IOSCharArray_Get(chars, iidx++) & (jint) 0xff);
    jint c2 = IOSByteArray_Get(AMBase64Utils_base64Values_, IOSCharArray_Get(chars, iidx++) & (jint) 0xff);
    jint c3 = IOSByteArray_Get(AMBase64Utils_base64Values_, IOSCharArray_Get(chars, iidx++) & (jint) 0xff);
    jint c24 = (LShift32(c0, 18)) | (LShift32(c1, 12)) | (LShift32(c2, 6)) | c3;
    *IOSByteArray_GetRef(bytes, oidx++) = (jbyte) (RShift32(c24, 16));
    if (oidx == olen) {
      break;
    }
    *IOSByteArray_GetRef(bytes, oidx++) = (jbyte) (RShift32(c24, 8));
    if (oidx == olen) {
      break;
    }
    *IOSByteArray_GetRef(bytes, oidx++) = (jbyte) c24;
  }
  return bytes;
}

jlong AMBase64Utils_longFromBase64WithNSString_(NSString *value) {
  AMBase64Utils_initialize();
  jint pos = 0;
  jlong longVal = IOSByteArray_Get(nil_chk(AMBase64Utils_base64Values_), [((NSString *) nil_chk(value)) charAtWithInt:pos++]);
  jint len = ((jint) [value length]);
  while (pos < len) {
    LShiftAssignLong(&longVal, 6);
    longVal |= IOSByteArray_Get(AMBase64Utils_base64Values_, [value charAtWithInt:pos++]);
  }
  return longVal;
}

NSString *AMBase64Utils_toBase64WithByteArray_(IOSByteArray *data) {
  AMBase64Utils_initialize();
  if (data == nil) {
    return nil;
  }
  jint len = ((IOSByteArray *) nil_chk(data))->size_;
  if (len == 0) {
    return @"";
  }
  jint olen = 4 * ((len + 2) / 3);
  IOSCharArray *chars = [IOSCharArray newArrayWithLength:olen];
  jint iidx = 0;
  jint oidx = 0;
  jint charsLeft = len;
  while (charsLeft > 0) {
    jint b0 = IOSByteArray_Get(data, iidx++) & (jint) 0xff;
    jint b1 = (charsLeft > 1) ? IOSByteArray_Get(data, iidx++) & (jint) 0xff : 0;
    jint b2 = (charsLeft > 2) ? IOSByteArray_Get(data, iidx++) & (jint) 0xff : 0;
    jint b24 = (LShift32(b0, 16)) | (LShift32(b1, 8)) | b2;
    jint c0 = (RShift32(b24, 18)) & (jint) 0x3f;
    jint c1 = (RShift32(b24, 12)) & (jint) 0x3f;
    jint c2 = (RShift32(b24, 6)) & (jint) 0x3f;
    jint c3 = b24 & (jint) 0x3f;
    *IOSCharArray_GetRef(chars, oidx++) = IOSCharArray_Get(nil_chk(AMBase64Utils_base64Chars_), c0);
    *IOSCharArray_GetRef(chars, oidx++) = IOSCharArray_Get(AMBase64Utils_base64Chars_, c1);
    *IOSCharArray_GetRef(chars, oidx++) = (charsLeft > 1) ? IOSCharArray_Get(AMBase64Utils_base64Chars_, c2) : '=';
    *IOSCharArray_GetRef(chars, oidx++) = (charsLeft > 2) ? IOSCharArray_Get(AMBase64Utils_base64Chars_, c3) : '=';
    charsLeft -= 3;
  }
  return [NSString stringWithCharacters:chars];
}

NSString *AMBase64Utils_toBase64WithLong_(jlong value) {
  AMBase64Utils_initialize();
  jint low = (jint) (value & (jint) 0xffffffff);
  jint high = (jint) (RShift64(value, 32));
  JavaLangStringBuilder *sb = new_JavaLangStringBuilder_init();
  jboolean haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(high, 28)) & (jint) 0xf, NO);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(high, 22)) & (jint) 0x3f, haveNonZero);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(high, 16)) & (jint) 0x3f, haveNonZero);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(high, 10)) & (jint) 0x3f, haveNonZero);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(high, 4)) & (jint) 0x3f, haveNonZero);
  jint v = (LShift32((high & (jint) 0xf), 2)) | ((RShift32(low, 30)) & (jint) 0x3);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, v, haveNonZero);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(low, 24)) & (jint) 0x3f, haveNonZero);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(low, 18)) & (jint) 0x3f, haveNonZero);
  haveNonZero = AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(low, 12)) & (jint) 0x3f, haveNonZero);
  AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, (RShift32(low, 6)) & (jint) 0x3f, haveNonZero);
  AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(sb, low & (jint) 0x3f, YES);
  return [sb description];
}

jboolean AMBase64Utils_base64AppendWithJavaLangStringBuilder_withInt_withBoolean_(JavaLangStringBuilder *sb, jint digit, jboolean haveNonZero) {
  AMBase64Utils_initialize();
  if (digit > 0) {
    haveNonZero = YES;
  }
  if (haveNonZero) {
    (void) [((JavaLangStringBuilder *) nil_chk(sb)) appendWithChar:IOSCharArray_Get(nil_chk(AMBase64Utils_base64Chars_), digit)];
  }
  return haveNonZero;
}

void AMBase64Utils_init(AMBase64Utils *self) {
  (void) NSObject_init(self);
}

AMBase64Utils *new_AMBase64Utils_init() {
  AMBase64Utils *self = [AMBase64Utils alloc];
  AMBase64Utils_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMBase64Utils)
