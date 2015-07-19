//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/modules/utils/ModuleActor.java
//


#include "J2ObjC_source.h"
#include "im/actor/model/Configuration.h"
#include "im/actor/model/api/OutPeer.h"
#include "im/actor/model/api/Peer.h"
#include "im/actor/model/api/PeerType.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/engine/KeyValueEngine.h"
#include "im/actor/model/droidkit/engine/ListEngine.h"
#include "im/actor/model/droidkit/engine/PreferencesStorage.h"
#include "im/actor/model/entity/Group.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/entity/PeerType.h"
#include "im/actor/model/entity/User.h"
#include "im/actor/model/modules/Auth.h"
#include "im/actor/model/modules/Groups.h"
#include "im/actor/model/modules/Messages.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/Updates.h"
#include "im/actor/model/modules/Users.h"
#include "im/actor/model/modules/utils/ModuleActor.h"
#include "im/actor/model/mvvm/MVVMCollection.h"
#include "im/actor/model/network/ActorApi.h"
#include "im/actor/model/network/RpcCallback.h"
#include "im/actor/model/network/RpcException.h"
#include "im/actor/model/network/parser/Request.h"
#include "im/actor/model/network/parser/Response.h"
#include "im/actor/model/viewmodel/GroupVM.h"
#include "im/actor/model/viewmodel/UserVM.h"
#include "java/lang/Runnable.h"
#include "java/lang/RuntimeException.h"

@interface ImActorModelModulesUtilsModuleActor () {
 @public
  ImActorModelModulesModules *modules__;
}

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesUtilsModuleActor, modules__, ImActorModelModulesModules *)

@interface ImActorModelModulesUtilsModuleActor_$1 : NSObject < AMRpcCallback >

- (void)onResult:(APResponse *)response;

- (void)onError:(AMRpcException *)e;

- (instancetype)init;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesUtilsModuleActor_$1)

__attribute__((unused)) static void ImActorModelModulesUtilsModuleActor_$1_init(ImActorModelModulesUtilsModuleActor_$1 *self);

__attribute__((unused)) static ImActorModelModulesUtilsModuleActor_$1 *new_ImActorModelModulesUtilsModuleActor_$1_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesUtilsModuleActor_$1)

@interface ImActorModelModulesUtilsModuleActor_$2 : NSObject < AMRpcCallback > {
 @public
  ImActorModelModulesUtilsModuleActor *this$0_;
  id<AMRpcCallback> val$callback_;
}

- (void)onResult:(APResponse *)response;

- (void)onError:(AMRpcException *)e;

- (instancetype)initWithImActorModelModulesUtilsModuleActor:(ImActorModelModulesUtilsModuleActor *)outer$
                                          withAMRpcCallback:(id<AMRpcCallback>)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesUtilsModuleActor_$2)

J2OBJC_FIELD_SETTER(ImActorModelModulesUtilsModuleActor_$2, this$0_, ImActorModelModulesUtilsModuleActor *)
J2OBJC_FIELD_SETTER(ImActorModelModulesUtilsModuleActor_$2, val$callback_, id<AMRpcCallback>)

__attribute__((unused)) static void ImActorModelModulesUtilsModuleActor_$2_initWithImActorModelModulesUtilsModuleActor_withAMRpcCallback_(ImActorModelModulesUtilsModuleActor_$2 *self, ImActorModelModulesUtilsModuleActor *outer$, id<AMRpcCallback> capture$0);

__attribute__((unused)) static ImActorModelModulesUtilsModuleActor_$2 *new_ImActorModelModulesUtilsModuleActor_$2_initWithImActorModelModulesUtilsModuleActor_withAMRpcCallback_(ImActorModelModulesUtilsModuleActor *outer$, id<AMRpcCallback> capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesUtilsModuleActor_$2)

@interface ImActorModelModulesUtilsModuleActor_$2_$1 : NSObject < JavaLangRunnable > {
 @public
  ImActorModelModulesUtilsModuleActor_$2 *this$0_;
  APResponse *val$response_;
}

- (void)run;

- (instancetype)initWithImActorModelModulesUtilsModuleActor_$2:(ImActorModelModulesUtilsModuleActor_$2 *)outer$
                                                withAPResponse:(APResponse *)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesUtilsModuleActor_$2_$1)

J2OBJC_FIELD_SETTER(ImActorModelModulesUtilsModuleActor_$2_$1, this$0_, ImActorModelModulesUtilsModuleActor_$2 *)
J2OBJC_FIELD_SETTER(ImActorModelModulesUtilsModuleActor_$2_$1, val$response_, id)

__attribute__((unused)) static void ImActorModelModulesUtilsModuleActor_$2_$1_initWithImActorModelModulesUtilsModuleActor_$2_withAPResponse_(ImActorModelModulesUtilsModuleActor_$2_$1 *self, ImActorModelModulesUtilsModuleActor_$2 *outer$, APResponse *capture$0);

__attribute__((unused)) static ImActorModelModulesUtilsModuleActor_$2_$1 *new_ImActorModelModulesUtilsModuleActor_$2_$1_initWithImActorModelModulesUtilsModuleActor_$2_withAPResponse_(ImActorModelModulesUtilsModuleActor_$2 *outer$, APResponse *capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesUtilsModuleActor_$2_$1)

@interface ImActorModelModulesUtilsModuleActor_$2_$2 : NSObject < JavaLangRunnable > {
 @public
  ImActorModelModulesUtilsModuleActor_$2 *this$0_;
  AMRpcException *val$e_;
}

- (void)run;

- (instancetype)initWithImActorModelModulesUtilsModuleActor_$2:(ImActorModelModulesUtilsModuleActor_$2 *)outer$
                                            withAMRpcException:(AMRpcException *)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesUtilsModuleActor_$2_$2)

J2OBJC_FIELD_SETTER(ImActorModelModulesUtilsModuleActor_$2_$2, this$0_, ImActorModelModulesUtilsModuleActor_$2 *)
J2OBJC_FIELD_SETTER(ImActorModelModulesUtilsModuleActor_$2_$2, val$e_, AMRpcException *)

__attribute__((unused)) static void ImActorModelModulesUtilsModuleActor_$2_$2_initWithImActorModelModulesUtilsModuleActor_$2_withAMRpcException_(ImActorModelModulesUtilsModuleActor_$2_$2 *self, ImActorModelModulesUtilsModuleActor_$2 *outer$, AMRpcException *capture$0);

__attribute__((unused)) static ImActorModelModulesUtilsModuleActor_$2_$2 *new_ImActorModelModulesUtilsModuleActor_$2_$2_initWithImActorModelModulesUtilsModuleActor_$2_withAMRpcException_(ImActorModelModulesUtilsModuleActor_$2 *outer$, AMRpcException *capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesUtilsModuleActor_$2_$2)

@implementation ImActorModelModulesUtilsModuleActor

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)modules {
  ImActorModelModulesUtilsModuleActor_initWithImActorModelModulesModules_(self, modules);
  return self;
}

- (APOutPeer *)buidOutPeerWithAMPeer:(AMPeer *)peer {
  if ([((AMPeer *) nil_chk(peer)) getPeerType] == AMPeerTypeEnum_get_PRIVATE()) {
    AMUser *user = [self getUserWithInt:[peer getPeerId]];
    if (user == nil) {
      return nil;
    }
    return new_APOutPeer_initWithAPPeerTypeEnum_withInt_withLong_(APPeerTypeEnum_get_PRIVATE(), [((AMUser *) nil_chk(user)) getUid], [user getAccessHash]);
  }
  else if ([peer getPeerType] == AMPeerTypeEnum_get_GROUP()) {
    AMGroup *group = [self getGroupWithInt:[peer getPeerId]];
    if (group == nil) {
      return nil;
    }
    return new_APOutPeer_initWithAPPeerTypeEnum_withInt_withLong_(APPeerTypeEnum_get_GROUP(), [((AMGroup *) nil_chk(group)) getGroupId], [group getAccessHash]);
  }
  else {
    @throw new_JavaLangRuntimeException_initWithNSString_(JreStrcat("$@", @"Unknown peer: ", peer));
  }
}

- (APPeer *)buildApiPeerWithAMPeer:(AMPeer *)peer {
  if ([((AMPeer *) nil_chk(peer)) getPeerType] == AMPeerTypeEnum_get_PRIVATE()) {
    return new_APPeer_initWithAPPeerTypeEnum_withInt_(APPeerTypeEnum_get_PRIVATE(), [peer getPeerId]);
  }
  else if ([peer getPeerType] == AMPeerTypeEnum_get_GROUP()) {
    return new_APPeer_initWithAPPeerTypeEnum_withInt_(APPeerTypeEnum_get_GROUP(), [peer getPeerId]);
  }
  else {
    return nil;
  }
}

- (id<DKKeyValueEngine>)users {
  return [((ImActorModelModulesUsers *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getUsersModule])) getUsers];
}

- (id<DKKeyValueEngine>)groups {
  return [((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getGroupsModule])) getGroups];
}

- (AMGroup *)getGroupWithInt:(jint)gid {
  return [((id<DKKeyValueEngine>) nil_chk([self groups])) getValueWithKey:gid];
}

- (AMUser *)getUserWithInt:(jint)uid {
  return [((id<DKKeyValueEngine>) nil_chk([self users])) getValueWithKey:uid];
}

- (AMUserVM *)getUserVMWithInt:(jint)uid {
  return [((AMMVVMCollection *) nil_chk([((ImActorModelModulesUsers *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getUsersModule])) getUsersCollection])) getWithId:uid];
}

- (AMGroupVM *)getGroupVMWithInt:(jint)gid {
  return [((AMMVVMCollection *) nil_chk([((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getGroupsModule])) getGroupsCollection])) getWithId:gid];
}

- (id<DKPreferencesStorage>)preferences {
  return [((ImActorModelModulesModules *) nil_chk(modules__)) getPreferences];
}

- (AMConfiguration *)config {
  return [((ImActorModelModulesModules *) nil_chk(modules__)) getConfiguration];
}

- (ImActorModelModulesUpdates *)updates {
  return [((ImActorModelModulesModules *) nil_chk(modules__)) getUpdatesModule];
}

- (id<DKListEngine>)messagesWithAMPeer:(AMPeer *)peer {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getMessagesModule])) getConversationEngineWithAMPeer:peer];
}

- (id<DKListEngine>)mediaWithAMPeer:(AMPeer *)peer {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getMessagesModule])) getMediaEngineWithAMPeer:peer];
}

- (jint)myUid {
  return [((ImActorModelModulesAuth *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getAuthModule])) myUid];
}

- (ImActorModelModulesModules *)modules {
  return modules__;
}

- (DKActorRef *)getConversationActorWithAMPeer:(AMPeer *)peer {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getConversationActorWithAMPeer:peer];
}

- (void)requestWithAPRequest:(APRequest *)request {
  [self requestWithAPRequest:request withAMRpcCallback:new_ImActorModelModulesUtilsModuleActor_$1_init()];
}

- (void)requestWithAPRequest:(APRequest *)request
           withAMRpcCallback:(id<AMRpcCallback>)callback {
  [((AMActorApi *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules__)) getActorApi])) requestWithAPRequest:request withAMRpcCallback:new_ImActorModelModulesUtilsModuleActor_$2_initWithImActorModelModulesUtilsModuleActor_withAMRpcCallback_(self, callback)];
}

@end

void ImActorModelModulesUtilsModuleActor_initWithImActorModelModulesModules_(ImActorModelModulesUtilsModuleActor *self, ImActorModelModulesModules *modules) {
  (void) DKActor_init(self);
  self->modules__ = modules;
}

ImActorModelModulesUtilsModuleActor *new_ImActorModelModulesUtilsModuleActor_initWithImActorModelModulesModules_(ImActorModelModulesModules *modules) {
  ImActorModelModulesUtilsModuleActor *self = [ImActorModelModulesUtilsModuleActor alloc];
  ImActorModelModulesUtilsModuleActor_initWithImActorModelModulesModules_(self, modules);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUtilsModuleActor)

@implementation ImActorModelModulesUtilsModuleActor_$1

- (void)onResult:(APResponse *)response {
}

- (void)onError:(AMRpcException *)e {
}

- (instancetype)init {
  ImActorModelModulesUtilsModuleActor_$1_init(self);
  return self;
}

@end

void ImActorModelModulesUtilsModuleActor_$1_init(ImActorModelModulesUtilsModuleActor_$1 *self) {
  (void) NSObject_init(self);
}

ImActorModelModulesUtilsModuleActor_$1 *new_ImActorModelModulesUtilsModuleActor_$1_init() {
  ImActorModelModulesUtilsModuleActor_$1 *self = [ImActorModelModulesUtilsModuleActor_$1 alloc];
  ImActorModelModulesUtilsModuleActor_$1_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUtilsModuleActor_$1)

@implementation ImActorModelModulesUtilsModuleActor_$2

- (void)onResult:(APResponse *)response {
  [((DKActorRef *) nil_chk([this$0_ self__])) sendWithId:new_ImActorModelModulesUtilsModuleActor_$2_$1_initWithImActorModelModulesUtilsModuleActor_$2_withAPResponse_(self, response)];
}

- (void)onError:(AMRpcException *)e {
  [((DKActorRef *) nil_chk([this$0_ self__])) sendWithId:new_ImActorModelModulesUtilsModuleActor_$2_$2_initWithImActorModelModulesUtilsModuleActor_$2_withAMRpcException_(self, e)];
}

- (instancetype)initWithImActorModelModulesUtilsModuleActor:(ImActorModelModulesUtilsModuleActor *)outer$
                                          withAMRpcCallback:(id<AMRpcCallback>)capture$0 {
  ImActorModelModulesUtilsModuleActor_$2_initWithImActorModelModulesUtilsModuleActor_withAMRpcCallback_(self, outer$, capture$0);
  return self;
}

@end

void ImActorModelModulesUtilsModuleActor_$2_initWithImActorModelModulesUtilsModuleActor_withAMRpcCallback_(ImActorModelModulesUtilsModuleActor_$2 *self, ImActorModelModulesUtilsModuleActor *outer$, id<AMRpcCallback> capture$0) {
  self->this$0_ = outer$;
  self->val$callback_ = capture$0;
  (void) NSObject_init(self);
}

ImActorModelModulesUtilsModuleActor_$2 *new_ImActorModelModulesUtilsModuleActor_$2_initWithImActorModelModulesUtilsModuleActor_withAMRpcCallback_(ImActorModelModulesUtilsModuleActor *outer$, id<AMRpcCallback> capture$0) {
  ImActorModelModulesUtilsModuleActor_$2 *self = [ImActorModelModulesUtilsModuleActor_$2 alloc];
  ImActorModelModulesUtilsModuleActor_$2_initWithImActorModelModulesUtilsModuleActor_withAMRpcCallback_(self, outer$, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUtilsModuleActor_$2)

@implementation ImActorModelModulesUtilsModuleActor_$2_$1

- (void)run {
  [((id<AMRpcCallback>) nil_chk(this$0_->val$callback_)) onResult:val$response_];
}

- (instancetype)initWithImActorModelModulesUtilsModuleActor_$2:(ImActorModelModulesUtilsModuleActor_$2 *)outer$
                                                withAPResponse:(APResponse *)capture$0 {
  ImActorModelModulesUtilsModuleActor_$2_$1_initWithImActorModelModulesUtilsModuleActor_$2_withAPResponse_(self, outer$, capture$0);
  return self;
}

@end

void ImActorModelModulesUtilsModuleActor_$2_$1_initWithImActorModelModulesUtilsModuleActor_$2_withAPResponse_(ImActorModelModulesUtilsModuleActor_$2_$1 *self, ImActorModelModulesUtilsModuleActor_$2 *outer$, APResponse *capture$0) {
  self->this$0_ = outer$;
  self->val$response_ = capture$0;
  (void) NSObject_init(self);
}

ImActorModelModulesUtilsModuleActor_$2_$1 *new_ImActorModelModulesUtilsModuleActor_$2_$1_initWithImActorModelModulesUtilsModuleActor_$2_withAPResponse_(ImActorModelModulesUtilsModuleActor_$2 *outer$, APResponse *capture$0) {
  ImActorModelModulesUtilsModuleActor_$2_$1 *self = [ImActorModelModulesUtilsModuleActor_$2_$1 alloc];
  ImActorModelModulesUtilsModuleActor_$2_$1_initWithImActorModelModulesUtilsModuleActor_$2_withAPResponse_(self, outer$, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUtilsModuleActor_$2_$1)

@implementation ImActorModelModulesUtilsModuleActor_$2_$2

- (void)run {
  [((id<AMRpcCallback>) nil_chk(this$0_->val$callback_)) onError:val$e_];
}

- (instancetype)initWithImActorModelModulesUtilsModuleActor_$2:(ImActorModelModulesUtilsModuleActor_$2 *)outer$
                                            withAMRpcException:(AMRpcException *)capture$0 {
  ImActorModelModulesUtilsModuleActor_$2_$2_initWithImActorModelModulesUtilsModuleActor_$2_withAMRpcException_(self, outer$, capture$0);
  return self;
}

@end

void ImActorModelModulesUtilsModuleActor_$2_$2_initWithImActorModelModulesUtilsModuleActor_$2_withAMRpcException_(ImActorModelModulesUtilsModuleActor_$2_$2 *self, ImActorModelModulesUtilsModuleActor_$2 *outer$, AMRpcException *capture$0) {
  self->this$0_ = outer$;
  self->val$e_ = capture$0;
  (void) NSObject_init(self);
}

ImActorModelModulesUtilsModuleActor_$2_$2 *new_ImActorModelModulesUtilsModuleActor_$2_$2_initWithImActorModelModulesUtilsModuleActor_$2_withAMRpcException_(ImActorModelModulesUtilsModuleActor_$2 *outer$, AMRpcException *capture$0) {
  ImActorModelModulesUtilsModuleActor_$2_$2 *self = [ImActorModelModulesUtilsModuleActor_$2_$2 alloc];
  ImActorModelModulesUtilsModuleActor_$2_$2_initWithImActorModelModulesUtilsModuleActor_$2_withAMRpcException_(self, outer$, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUtilsModuleActor_$2_$2)
