//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/api/rpc/RequestMessageReceived.java
//

#ifndef _APRequestMessageReceived_H_
#define _APRequestMessageReceived_H_

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Request.h"

@class APOutPeer;
@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;

#define APRequestMessageReceived_HEADER 55

@interface APRequestMessageReceived : APRequest

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithAPOutPeer:(APOutPeer *)peer
                         withLong:(jlong)date;

+ (APRequestMessageReceived *)fromBytesWithByteArray:(IOSByteArray *)data;

- (jlong)getDate;

- (jint)getHeaderKey;

- (APOutPeer *)getPeer;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(APRequestMessageReceived)

J2OBJC_STATIC_FIELD_GETTER(APRequestMessageReceived, HEADER, jint)

FOUNDATION_EXPORT APRequestMessageReceived *APRequestMessageReceived_fromBytesWithByteArray_(IOSByteArray *data);

FOUNDATION_EXPORT void APRequestMessageReceived_initWithAPOutPeer_withLong_(APRequestMessageReceived *self, APOutPeer *peer, jlong date);

FOUNDATION_EXPORT APRequestMessageReceived *new_APRequestMessageReceived_initWithAPOutPeer_withLong_(APOutPeer *peer, jlong date) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void APRequestMessageReceived_init(APRequestMessageReceived *self);

FOUNDATION_EXPORT APRequestMessageReceived *new_APRequestMessageReceived_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(APRequestMessageReceived)

typedef APRequestMessageReceived ImActorModelApiRpcRequestMessageReceived;

#endif // _APRequestMessageReceived_H_
