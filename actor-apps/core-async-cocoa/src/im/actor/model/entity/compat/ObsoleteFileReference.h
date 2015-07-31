//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/entity/compat/ObsoleteFileReference.java
//

#ifndef _ImActorModelEntityCompatObsoleteFileReference_H_
#define _ImActorModelEntityCompatObsoleteFileReference_H_

#include "J2ObjC_header.h"
#include "im/actor/model/droidkit/bser/BserObject.h"

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;

@interface ImActorModelEntityCompatObsoleteFileReference : BSBserObject

#pragma mark Public

- (instancetype)initWithBSBserValues:(BSBserValues *)values;

- (instancetype)initWithByteArray:(IOSByteArray *)data;

- (jlong)getAccessHash;

- (jlong)getFileId;

- (NSString *)getFileName;

- (jint)getFileSize;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelEntityCompatObsoleteFileReference)

FOUNDATION_EXPORT void ImActorModelEntityCompatObsoleteFileReference_initWithByteArray_(ImActorModelEntityCompatObsoleteFileReference *self, IOSByteArray *data);

FOUNDATION_EXPORT ImActorModelEntityCompatObsoleteFileReference *new_ImActorModelEntityCompatObsoleteFileReference_initWithByteArray_(IOSByteArray *data) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void ImActorModelEntityCompatObsoleteFileReference_initWithBSBserValues_(ImActorModelEntityCompatObsoleteFileReference *self, BSBserValues *values);

FOUNDATION_EXPORT ImActorModelEntityCompatObsoleteFileReference *new_ImActorModelEntityCompatObsoleteFileReference_initWithBSBserValues_(BSBserValues *values) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelEntityCompatObsoleteFileReference)

#endif // _ImActorModelEntityCompatObsoleteFileReference_H_
