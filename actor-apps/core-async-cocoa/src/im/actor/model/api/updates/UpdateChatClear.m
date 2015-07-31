//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/api/updates/UpdateChatClear.java
//


#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/Peer.h"
#include "im/actor/model/api/updates/UpdateChatClear.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/network/parser/Update.h"
#include "java/io/IOException.h"

@interface APUpdateChatClear () {
 @public
  APPeer *peer_;
}

@end

J2OBJC_FIELD_SETTER(APUpdateChatClear, peer_, APPeer *)

@implementation APUpdateChatClear

+ (APUpdateChatClear *)fromBytesWithByteArray:(IOSByteArray *)data {
  return APUpdateChatClear_fromBytesWithByteArray_(data);
}

- (instancetype)initWithAPPeer:(APPeer *)peer {
  APUpdateChatClear_initWithAPPeer_(self, peer);
  return self;
}

- (instancetype)init {
  APUpdateChatClear_init(self);
  return self;
}

- (APPeer *)getPeer {
  return self->peer_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->peer_ = [((BSBserValues *) nil_chk(values)) getObjWithInt:1 withBSBserObject:new_APPeer_init()];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  if (self->peer_ == nil) {
    @throw new_JavaIoIOException_init();
  }
  [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:1 withBSBserObject:self->peer_];
}

- (NSString *)description {
  NSString *res = @"update ChatClear{";
  res = JreStrcat("$$", res, JreStrcat("$@", @"peer=", self->peer_));
  res = JreStrcat("$C", res, '}');
  return res;
}

- (jint)getHeaderKey {
  return APUpdateChatClear_HEADER;
}

@end

APUpdateChatClear *APUpdateChatClear_fromBytesWithByteArray_(IOSByteArray *data) {
  APUpdateChatClear_initialize();
  return ((APUpdateChatClear *) BSBser_parseWithBSBserObject_withByteArray_(new_APUpdateChatClear_init(), data));
}

void APUpdateChatClear_initWithAPPeer_(APUpdateChatClear *self, APPeer *peer) {
  (void) APUpdate_init(self);
  self->peer_ = peer;
}

APUpdateChatClear *new_APUpdateChatClear_initWithAPPeer_(APPeer *peer) {
  APUpdateChatClear *self = [APUpdateChatClear alloc];
  APUpdateChatClear_initWithAPPeer_(self, peer);
  return self;
}

void APUpdateChatClear_init(APUpdateChatClear *self) {
  (void) APUpdate_init(self);
}

APUpdateChatClear *new_APUpdateChatClear_init() {
  APUpdateChatClear *self = [APUpdateChatClear alloc];
  APUpdateChatClear_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(APUpdateChatClear)
