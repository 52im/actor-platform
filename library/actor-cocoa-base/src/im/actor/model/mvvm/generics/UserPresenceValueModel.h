//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/mvvm/generics/UserPresenceValueModel.java
//

#ifndef _AMUserPresenceValueModel_H_
#define _AMUserPresenceValueModel_H_

#include "J2ObjC_header.h"
#include "im/actor/model/mvvm/ValueModel.h"

@class AMUserPresence;

@interface AMUserPresenceValueModel : AMValueModel

#pragma mark Public

- (instancetype)initWithNSString:(NSString *)name
              withAMUserPresence:(AMUserPresence *)defaultValue;

- (AMUserPresence *)get;

@end

J2OBJC_EMPTY_STATIC_INIT(AMUserPresenceValueModel)

FOUNDATION_EXPORT void AMUserPresenceValueModel_initWithNSString_withAMUserPresence_(AMUserPresenceValueModel *self, NSString *name, AMUserPresence *defaultValue);

FOUNDATION_EXPORT AMUserPresenceValueModel *new_AMUserPresenceValueModel_initWithNSString_withAMUserPresence_(NSString *name, AMUserPresence *defaultValue) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMUserPresenceValueModel)

typedef AMUserPresenceValueModel ImActorModelMvvmGenericsUserPresenceValueModel;

#endif // _AMUserPresenceValueModel_H_
