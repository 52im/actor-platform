//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/api/ContactRecord.java
//

#ifndef _APContactRecord_H_
#define _APContactRecord_H_

#include "J2ObjC_header.h"
#include "im/actor/model/droidkit/bser/BserObject.h"

@class APContactTypeEnum;
@class BSBserValues;
@class BSBserWriter;
@class JavaLangLong;

@interface APContactRecord : BSBserObject

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithAPContactTypeEnum:(APContactTypeEnum *)type
                             withNSString:(NSString *)stringValue
                         withJavaLangLong:(JavaLangLong *)longValue
                             withNSString:(NSString *)title
                             withNSString:(NSString *)subtitle;

- (JavaLangLong *)getLongValue;

- (NSString *)getStringValue;

- (NSString *)getSubtitle;

- (NSString *)getTitle;

- (APContactTypeEnum *)getType;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(APContactRecord)

FOUNDATION_EXPORT void APContactRecord_initWithAPContactTypeEnum_withNSString_withJavaLangLong_withNSString_withNSString_(APContactRecord *self, APContactTypeEnum *type, NSString *stringValue, JavaLangLong *longValue, NSString *title, NSString *subtitle);

FOUNDATION_EXPORT APContactRecord *new_APContactRecord_initWithAPContactTypeEnum_withNSString_withJavaLangLong_withNSString_withNSString_(APContactTypeEnum *type, NSString *stringValue, JavaLangLong *longValue, NSString *title, NSString *subtitle) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void APContactRecord_init(APContactRecord *self);

FOUNDATION_EXPORT APContactRecord *new_APContactRecord_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(APContactRecord)

typedef APContactRecord ImActorModelApiContactRecord;

#endif // _APContactRecord_H_
