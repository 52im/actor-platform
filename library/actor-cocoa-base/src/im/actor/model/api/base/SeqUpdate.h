//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/base/SeqUpdate.java
//

#ifndef _ImActorModelApiBaseSeqUpdate_H_
#define _ImActorModelApiBaseSeqUpdate_H_

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/RpcScope.h"

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;

#define ImActorModelApiBaseSeqUpdate_HEADER 13

@interface ImActorModelApiBaseSeqUpdate : APRpcScope

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithInt:(jint)seq
              withByteArray:(IOSByteArray *)state
                    withInt:(jint)updateHeader
              withByteArray:(IOSByteArray *)update;

+ (ImActorModelApiBaseSeqUpdate *)fromBytesWithByteArray:(IOSByteArray *)data;

- (jint)getHeaderKey;

- (jint)getSeq;

- (IOSByteArray *)getState;

- (IOSByteArray *)getUpdate;

- (jint)getUpdateHeader;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelApiBaseSeqUpdate)

J2OBJC_STATIC_FIELD_GETTER(ImActorModelApiBaseSeqUpdate, HEADER, jint)

FOUNDATION_EXPORT ImActorModelApiBaseSeqUpdate *ImActorModelApiBaseSeqUpdate_fromBytesWithByteArray_(IOSByteArray *data);

FOUNDATION_EXPORT void ImActorModelApiBaseSeqUpdate_initWithInt_withByteArray_withInt_withByteArray_(ImActorModelApiBaseSeqUpdate *self, jint seq, IOSByteArray *state, jint updateHeader, IOSByteArray *update);

FOUNDATION_EXPORT ImActorModelApiBaseSeqUpdate *new_ImActorModelApiBaseSeqUpdate_initWithInt_withByteArray_withInt_withByteArray_(jint seq, IOSByteArray *state, jint updateHeader, IOSByteArray *update) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void ImActorModelApiBaseSeqUpdate_init(ImActorModelApiBaseSeqUpdate *self);

FOUNDATION_EXPORT ImActorModelApiBaseSeqUpdate *new_ImActorModelApiBaseSeqUpdate_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelApiBaseSeqUpdate)

#endif // _ImActorModelApiBaseSeqUpdate_H_
