//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/api/rpc/RequestSubscribeFromGroupOnline.java
//

#ifndef _APRequestSubscribeFromGroupOnline_H_
#define _APRequestSubscribeFromGroupOnline_H_

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Request.h"

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;
@protocol JavaUtilList;

#define APRequestSubscribeFromGroupOnline_HEADER 75

@interface APRequestSubscribeFromGroupOnline : APRequest

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithJavaUtilList:(id<JavaUtilList>)groups;

+ (APRequestSubscribeFromGroupOnline *)fromBytesWithByteArray:(IOSByteArray *)data;

- (id<JavaUtilList>)getGroups;

- (jint)getHeaderKey;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(APRequestSubscribeFromGroupOnline)

J2OBJC_STATIC_FIELD_GETTER(APRequestSubscribeFromGroupOnline, HEADER, jint)

FOUNDATION_EXPORT APRequestSubscribeFromGroupOnline *APRequestSubscribeFromGroupOnline_fromBytesWithByteArray_(IOSByteArray *data);

FOUNDATION_EXPORT void APRequestSubscribeFromGroupOnline_initWithJavaUtilList_(APRequestSubscribeFromGroupOnline *self, id<JavaUtilList> groups);

FOUNDATION_EXPORT APRequestSubscribeFromGroupOnline *new_APRequestSubscribeFromGroupOnline_initWithJavaUtilList_(id<JavaUtilList> groups) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void APRequestSubscribeFromGroupOnline_init(APRequestSubscribeFromGroupOnline *self);

FOUNDATION_EXPORT APRequestSubscribeFromGroupOnline *new_APRequestSubscribeFromGroupOnline_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(APRequestSubscribeFromGroupOnline)

typedef APRequestSubscribeFromGroupOnline ImActorModelApiRpcRequestSubscribeFromGroupOnline;

#endif // _APRequestSubscribeFromGroupOnline_H_
