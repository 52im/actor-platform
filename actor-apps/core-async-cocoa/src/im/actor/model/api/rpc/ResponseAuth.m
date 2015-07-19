//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/api/rpc/ResponseAuth.java
//


#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/Config.h"
#include "im/actor/model/api/User.h"
#include "im/actor/model/api/rpc/ResponseAuth.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/network/parser/Response.h"
#include "java/io/IOException.h"

@interface APResponseAuth () {
 @public
  APUser *user_;
  APConfig *config_;
}

@end

J2OBJC_FIELD_SETTER(APResponseAuth, user_, APUser *)
J2OBJC_FIELD_SETTER(APResponseAuth, config_, APConfig *)

@implementation APResponseAuth

+ (APResponseAuth *)fromBytesWithByteArray:(IOSByteArray *)data {
  return APResponseAuth_fromBytesWithByteArray_(data);
}

- (instancetype)initWithAPUser:(APUser *)user
                  withAPConfig:(APConfig *)config {
  APResponseAuth_initWithAPUser_withAPConfig_(self, user, config);
  return self;
}

- (instancetype)init {
  APResponseAuth_init(self);
  return self;
}

- (APUser *)getUser {
  return self->user_;
}

- (APConfig *)getConfig {
  return self->config_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->user_ = [((BSBserValues *) nil_chk(values)) getObjWithInt:2 withBSBserObject:new_APUser_init()];
  self->config_ = [values getObjWithInt:3 withBSBserObject:new_APConfig_init()];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  if (self->user_ == nil) {
    @throw new_JavaIoIOException_init();
  }
  [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:2 withBSBserObject:self->user_];
  if (self->config_ == nil) {
    @throw new_JavaIoIOException_init();
  }
  [writer writeObjectWithInt:3 withBSBserObject:self->config_];
}

- (NSString *)description {
  NSString *res = @"response Auth{";
  res = JreStrcat("$$", res, JreStrcat("$$", @"user=", (self->user_ != nil ? @"set" : @"empty")));
  res = JreStrcat("$$", res, JreStrcat("$@", @", config=", self->config_));
  res = JreStrcat("$C", res, '}');
  return res;
}

- (jint)getHeaderKey {
  return APResponseAuth_HEADER;
}

@end

APResponseAuth *APResponseAuth_fromBytesWithByteArray_(IOSByteArray *data) {
  APResponseAuth_initialize();
  return ((APResponseAuth *) BSBser_parseWithBSBserObject_withByteArray_(new_APResponseAuth_init(), data));
}

void APResponseAuth_initWithAPUser_withAPConfig_(APResponseAuth *self, APUser *user, APConfig *config) {
  (void) APResponse_init(self);
  self->user_ = user;
  self->config_ = config;
}

APResponseAuth *new_APResponseAuth_initWithAPUser_withAPConfig_(APUser *user, APConfig *config) {
  APResponseAuth *self = [APResponseAuth alloc];
  APResponseAuth_initWithAPUser_withAPConfig_(self, user, config);
  return self;
}

void APResponseAuth_init(APResponseAuth *self) {
  (void) APResponse_init(self);
}

APResponseAuth *new_APResponseAuth_init() {
  APResponseAuth *self = [APResponseAuth alloc];
  APResponseAuth_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(APResponseAuth)
