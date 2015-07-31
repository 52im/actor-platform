//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/network/RpcException.java
//


#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/network/RpcException.h"
#include "java/lang/Exception.h"

@interface AMRpcException () {
 @public
  NSString *tag_;
  jint code_;
  NSString *message_;
  jboolean canTryAgain_;
  IOSByteArray *relatedData_;
}

@end

J2OBJC_FIELD_SETTER(AMRpcException, tag_, NSString *)
J2OBJC_FIELD_SETTER(AMRpcException, message_, NSString *)
J2OBJC_FIELD_SETTER(AMRpcException, relatedData_, IOSByteArray *)

@implementation AMRpcException

- (instancetype)initWithNSString:(NSString *)tag
                         withInt:(jint)code
                    withNSString:(NSString *)message
                     withBoolean:(jboolean)canTryAgain
                   withByteArray:(IOSByteArray *)relatedData {
  AMRpcException_initWithNSString_withInt_withNSString_withBoolean_withByteArray_(self, tag, code, message, canTryAgain, relatedData);
  return self;
}

- (jboolean)isCanTryAgain {
  return canTryAgain_;
}

- (IOSByteArray *)getRelatedData {
  return relatedData_;
}

- (NSString *)getTag {
  return tag_;
}

- (jint)getCode {
  return code_;
}

- (NSString *)getMessage {
  return message_;
}

@end

void AMRpcException_initWithNSString_withInt_withNSString_withBoolean_withByteArray_(AMRpcException *self, NSString *tag, jint code, NSString *message, jboolean canTryAgain, IOSByteArray *relatedData) {
  (void) JavaLangException_init(self);
  self->tag_ = tag;
  self->code_ = code;
  self->message_ = message;
  self->canTryAgain_ = canTryAgain;
  self->relatedData_ = relatedData;
}

AMRpcException *new_AMRpcException_initWithNSString_withInt_withNSString_withBoolean_withByteArray_(NSString *tag, jint code, NSString *message, jboolean canTryAgain, IOSByteArray *relatedData) {
  AMRpcException *self = [AMRpcException alloc];
  AMRpcException_initWithNSString_withInt_withNSString_withBoolean_withByteArray_(self, tag, code, message, canTryAgain, relatedData);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMRpcException)
