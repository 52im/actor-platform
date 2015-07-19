//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/network/mtp/entity/MessageAck.java
//

#ifndef _MTMessageAck_H_
#define _MTMessageAck_H_

#include "J2ObjC_header.h"
#include "im/actor/model/network/mtp/entity/ProtoStruct.h"

@class BSDataInput;
@class BSDataOutput;
@class IOSLongArray;
@class IOSObjectArray;

#define MTMessageAck_HEADER 6

@interface MTMessageAck : MTProtoStruct {
 @public
  IOSLongArray *messagesIds_;
}

#pragma mark Public

- (instancetype)initWithBSDataInput:(BSDataInput *)stream;

- (instancetype)initWithJavaLangLongArray:(IOSObjectArray *)_messagesIds;

- (instancetype)initWithLongArray:(IOSLongArray *)messagesIds;

- (NSString *)description;

#pragma mark Protected

- (jbyte)getHeader;

- (void)readBodyWithBSDataInput:(BSDataInput *)bs;

- (void)writeBodyWithBSDataOutput:(BSDataOutput *)bs;

@end

J2OBJC_EMPTY_STATIC_INIT(MTMessageAck)

J2OBJC_FIELD_SETTER(MTMessageAck, messagesIds_, IOSLongArray *)

J2OBJC_STATIC_FIELD_GETTER(MTMessageAck, HEADER, jbyte)

FOUNDATION_EXPORT void MTMessageAck_initWithBSDataInput_(MTMessageAck *self, BSDataInput *stream);

FOUNDATION_EXPORT MTMessageAck *new_MTMessageAck_initWithBSDataInput_(BSDataInput *stream) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void MTMessageAck_initWithJavaLangLongArray_(MTMessageAck *self, IOSObjectArray *_messagesIds);

FOUNDATION_EXPORT MTMessageAck *new_MTMessageAck_initWithJavaLangLongArray_(IOSObjectArray *_messagesIds) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void MTMessageAck_initWithLongArray_(MTMessageAck *self, IOSLongArray *messagesIds);

FOUNDATION_EXPORT MTMessageAck *new_MTMessageAck_initWithLongArray_(IOSLongArray *messagesIds) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(MTMessageAck)

typedef MTMessageAck ImActorModelNetworkMtpEntityMessageAck;

#endif // _MTMessageAck_H_
