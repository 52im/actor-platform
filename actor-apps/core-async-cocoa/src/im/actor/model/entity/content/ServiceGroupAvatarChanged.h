//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/entity/content/ServiceGroupAvatarChanged.java
//

#ifndef _AMServiceGroupAvatarChanged_H_
#define _AMServiceGroupAvatarChanged_H_

#include "J2ObjC_header.h"
#include "im/actor/model/entity/content/ServiceContent.h"

@class AMAvatar;
@class APAvatar;
@class ImActorModelEntityContentInternalContentRemoteContainer;

@interface AMServiceGroupAvatarChanged : AMServiceContent

#pragma mark Public

- (instancetype)initWithImActorModelEntityContentInternalContentRemoteContainer:(ImActorModelEntityContentInternalContentRemoteContainer *)remoteContainer;

+ (AMServiceGroupAvatarChanged *)createWithAPAvatar:(APAvatar *)avatar;

- (AMAvatar *)getNewAvatar;

@end

J2OBJC_EMPTY_STATIC_INIT(AMServiceGroupAvatarChanged)

FOUNDATION_EXPORT AMServiceGroupAvatarChanged *AMServiceGroupAvatarChanged_createWithAPAvatar_(APAvatar *avatar);

FOUNDATION_EXPORT void AMServiceGroupAvatarChanged_initWithImActorModelEntityContentInternalContentRemoteContainer_(AMServiceGroupAvatarChanged *self, ImActorModelEntityContentInternalContentRemoteContainer *remoteContainer);

FOUNDATION_EXPORT AMServiceGroupAvatarChanged *new_AMServiceGroupAvatarChanged_initWithImActorModelEntityContentInternalContentRemoteContainer_(ImActorModelEntityContentInternalContentRemoteContainer *remoteContainer) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMServiceGroupAvatarChanged)

typedef AMServiceGroupAvatarChanged ImActorModelEntityContentServiceGroupAvatarChanged;

#endif // _AMServiceGroupAvatarChanged_H_
