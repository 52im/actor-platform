//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core/src/main/java/im/actor/model/modules/avatar/GroupAvatarChangeActor.java
//


#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/Avatar.h"
#include "im/actor/model/api/FileLocation.h"
#include "im/actor/model/api/GroupOutPeer.h"
#include "im/actor/model/api/base/SeqUpdate.h"
#include "im/actor/model/api/rpc/RequestEditGroupAvatar.h"
#include "im/actor/model/api/rpc/RequestRemoveGroupAvatar.h"
#include "im/actor/model/api/rpc/ResponseEditGroupAvatar.h"
#include "im/actor/model/api/rpc/ResponseSeqDate.h"
#include "im/actor/model/api/updates/UpdateGroupAvatarChanged.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/engine/KeyValueEngine.h"
#include "im/actor/model/entity/FileReference.h"
#include "im/actor/model/entity/Group.h"
#include "im/actor/model/modules/Files.h"
#include "im/actor/model/modules/Groups.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/Profile.h"
#include "im/actor/model/modules/Updates.h"
#include "im/actor/model/modules/avatar/GroupAvatarChangeActor.h"
#include "im/actor/model/modules/file/UploadManager.h"
#include "im/actor/model/modules/updates/internal/ExecuteAfter.h"
#include "im/actor/model/modules/utils/ModuleActor.h"
#include "im/actor/model/modules/utils/RandomUtils.h"
#include "im/actor/model/mvvm/ValueModel.h"
#include "im/actor/model/network/RpcCallback.h"
#include "im/actor/model/network/RpcException.h"
#include "im/actor/model/viewmodel/AvatarUploadState.h"
#include "im/actor/model/viewmodel/GroupAvatarVM.h"
#include "im/actor/model/viewmodel/OwnAvatarVM.h"
#include "java/lang/Integer.h"
#include "java/lang/Long.h"
#include "java/lang/Runnable.h"
#include "java/util/HashMap.h"

@interface ImActorModelModulesAvatarGroupAvatarChangeActor () {
 @public
  JavaUtilHashMap *currentTasks_;
  JavaUtilHashMap *tasksMap_;
}

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarGroupAvatarChangeActor, currentTasks_, JavaUtilHashMap *)
J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarGroupAvatarChangeActor, tasksMap_, JavaUtilHashMap *)

@interface ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged () {
 @public
  jint gid_;
  jlong rid_;
}

@end

@interface ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar () {
 @public
  jint gid_;
  NSString *descriptor_;
}

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar, descriptor_, NSString *)

@interface ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar () {
 @public
  jint gid_;
}

@end

@interface ImActorModelModulesAvatarGroupAvatarChangeActor_$1 : NSObject < AMRpcCallback > {
 @public
  ImActorModelModulesAvatarGroupAvatarChangeActor *this$0_;
  jint val$gid_;
  jlong val$rid_;
}

- (void)onResult:(APResponseEditGroupAvatar *)response;

- (void)onError:(AMRpcException *)e;

- (instancetype)initWithImActorModelModulesAvatarGroupAvatarChangeActor:(ImActorModelModulesAvatarGroupAvatarChangeActor *)outer$
                                                                withInt:(jint)capture$0
                                                               withLong:(jlong)capture$1;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesAvatarGroupAvatarChangeActor_$1)

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarGroupAvatarChangeActor_$1, this$0_, ImActorModelModulesAvatarGroupAvatarChangeActor *)

__attribute__((unused)) static void ImActorModelModulesAvatarGroupAvatarChangeActor_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_withInt_withLong_(ImActorModelModulesAvatarGroupAvatarChangeActor_$1 *self, ImActorModelModulesAvatarGroupAvatarChangeActor *outer$, jint capture$0, jlong capture$1);

__attribute__((unused)) static ImActorModelModulesAvatarGroupAvatarChangeActor_$1 *new_ImActorModelModulesAvatarGroupAvatarChangeActor_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_withInt_withLong_(ImActorModelModulesAvatarGroupAvatarChangeActor *outer$, jint capture$0, jlong capture$1) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesAvatarGroupAvatarChangeActor_$1)

@interface ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1 : NSObject < JavaLangRunnable > {
 @public
  ImActorModelModulesAvatarGroupAvatarChangeActor_$1 *this$0_;
}

- (void)run;

- (instancetype)initWithImActorModelModulesAvatarGroupAvatarChangeActor_$1:(ImActorModelModulesAvatarGroupAvatarChangeActor_$1 *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1)

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1, this$0_, ImActorModelModulesAvatarGroupAvatarChangeActor_$1 *)

__attribute__((unused)) static void ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_$1_(ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1 *self, ImActorModelModulesAvatarGroupAvatarChangeActor_$1 *outer$);

__attribute__((unused)) static ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1 *new_ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_$1_(ImActorModelModulesAvatarGroupAvatarChangeActor_$1 *outer$) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1)

@interface ImActorModelModulesAvatarGroupAvatarChangeActor_$2 : NSObject < AMRpcCallback > {
 @public
  ImActorModelModulesAvatarGroupAvatarChangeActor *this$0_;
  jint val$gid_;
  jlong val$rid_;
}

- (void)onResult:(APResponseSeqDate *)response;

- (void)onError:(AMRpcException *)e;

- (instancetype)initWithImActorModelModulesAvatarGroupAvatarChangeActor:(ImActorModelModulesAvatarGroupAvatarChangeActor *)outer$
                                                                withInt:(jint)capture$0
                                                               withLong:(jlong)capture$1;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesAvatarGroupAvatarChangeActor_$2)

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarGroupAvatarChangeActor_$2, this$0_, ImActorModelModulesAvatarGroupAvatarChangeActor *)

__attribute__((unused)) static void ImActorModelModulesAvatarGroupAvatarChangeActor_$2_initWithImActorModelModulesAvatarGroupAvatarChangeActor_withInt_withLong_(ImActorModelModulesAvatarGroupAvatarChangeActor_$2 *self, ImActorModelModulesAvatarGroupAvatarChangeActor *outer$, jint capture$0, jlong capture$1);

__attribute__((unused)) static ImActorModelModulesAvatarGroupAvatarChangeActor_$2 *new_ImActorModelModulesAvatarGroupAvatarChangeActor_$2_initWithImActorModelModulesAvatarGroupAvatarChangeActor_withInt_withLong_(ImActorModelModulesAvatarGroupAvatarChangeActor *outer$, jint capture$0, jlong capture$1) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesAvatarGroupAvatarChangeActor_$2)

@interface ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1 : NSObject < JavaLangRunnable > {
 @public
  ImActorModelModulesAvatarGroupAvatarChangeActor_$2 *this$0_;
}

- (void)run;

- (instancetype)initWithImActorModelModulesAvatarGroupAvatarChangeActor_$2:(ImActorModelModulesAvatarGroupAvatarChangeActor_$2 *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1)

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1, this$0_, ImActorModelModulesAvatarGroupAvatarChangeActor_$2 *)

__attribute__((unused)) static void ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_$2_(ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1 *self, ImActorModelModulesAvatarGroupAvatarChangeActor_$2 *outer$);

__attribute__((unused)) static ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1 *new_ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_$2_(ImActorModelModulesAvatarGroupAvatarChangeActor_$2 *outer$) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1)

@implementation ImActorModelModulesAvatarGroupAvatarChangeActor

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)modules {
  ImActorModelModulesAvatarGroupAvatarChangeActor_initWithImActorModelModulesModules_(self, modules);
  return self;
}

- (void)changeAvatarWithInt:(jint)gid
               withNSString:(NSString *)descriptor {
  if ([((JavaUtilHashMap *) nil_chk(currentTasks_)) containsKeyWithId:JavaLangInteger_valueOfWithInt_(gid)]) {
    [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getFilesModule])) cancelUploadWithLong:[((JavaLangLong *) nil_chk([currentTasks_ getWithId:JavaLangInteger_valueOfWithInt_(gid)])) longLongValue]];
    (void) [currentTasks_ removeWithId:JavaLangInteger_valueOfWithInt_(gid)];
  }
  jlong rid = ImActorModelModulesUtilsRandomUtils_nextRid();
  (void) [currentTasks_ putWithId:JavaLangInteger_valueOfWithInt_(gid) withId:JavaLangLong_valueOfWithLong_(rid)];
  (void) [((JavaUtilHashMap *) nil_chk(tasksMap_)) putWithId:JavaLangLong_valueOfWithLong_(rid) withId:JavaLangInteger_valueOfWithInt_(gid)];
  [((AMValueModel *) nil_chk([((AMGroupAvatarVM *) nil_chk([((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getGroupsModule])) getAvatarVMWithInt:gid])) getUploadState])) changeWithValue:new_AMAvatarUploadState_initWithNSString_withBoolean_(descriptor, YES)];
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getFilesModule])) requestUploadWithLong:rid withNSString:descriptor withNSString:@"avatar.jpg" withDKActorRef:[self self__]];
}

- (void)uploadCompletedWithLong:(jlong)rid
            withAMFileReference:(AMFileReference *)fileReference {
  if (![((JavaUtilHashMap *) nil_chk(tasksMap_)) containsKeyWithId:JavaLangLong_valueOfWithLong_(rid)]) {
    return;
  }
  jint gid = [((JavaLangInteger *) nil_chk([tasksMap_ getWithId:JavaLangLong_valueOfWithLong_(rid)])) intValue];
  jlong accessHash = [((AMGroup *) nil_chk([self getGroupWithInt:gid])) getAccessHash];
  if ([((JavaLangLong *) nil_chk([((JavaUtilHashMap *) nil_chk(currentTasks_)) getWithId:JavaLangInteger_valueOfWithInt_(gid)])) longLongValue] != rid) {
    return;
  }
  [self requestWithAPRequest:new_APRequestEditGroupAvatar_initWithAPGroupOutPeer_withLong_withAPFileLocation_(new_APGroupOutPeer_initWithInt_withLong_(gid, accessHash), rid, new_APFileLocation_initWithLong_withLong_([((AMFileReference *) nil_chk(fileReference)) getFileId], [fileReference getAccessHash])) withAMRpcCallback:new_ImActorModelModulesAvatarGroupAvatarChangeActor_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_withInt_withLong_(self, gid, rid)];
}

- (void)avatarChangedWithInt:(jint)gid
                    withLong:(jlong)rid {
  if (![((JavaUtilHashMap *) nil_chk(currentTasks_)) containsKeyWithId:JavaLangInteger_valueOfWithInt_(gid)]) {
    return;
  }
  if ([((JavaLangLong *) nil_chk([currentTasks_ getWithId:JavaLangInteger_valueOfWithInt_(gid)])) longLongValue] != rid) {
    return;
  }
  (void) [currentTasks_ removeWithId:JavaLangInteger_valueOfWithInt_(gid)];
  [((AMValueModel *) nil_chk([((AMGroupAvatarVM *) nil_chk([((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getGroupsModule])) getAvatarVMWithInt:gid])) getUploadState])) changeWithValue:new_AMAvatarUploadState_initWithNSString_withBoolean_(nil, NO)];
}

- (void)uploadErrorWithLong:(jlong)rid {
  if (![((JavaUtilHashMap *) nil_chk(tasksMap_)) containsKeyWithId:JavaLangLong_valueOfWithLong_(rid)]) {
    return;
  }
  jint gid = [((JavaLangInteger *) nil_chk([tasksMap_ getWithId:JavaLangLong_valueOfWithLong_(rid)])) intValue];
  if ([((JavaLangLong *) nil_chk([((JavaUtilHashMap *) nil_chk(currentTasks_)) getWithId:JavaLangInteger_valueOfWithInt_(gid)])) longLongValue] != rid) {
    return;
  }
  (void) [currentTasks_ removeWithId:JavaLangInteger_valueOfWithInt_(gid)];
  (void) [tasksMap_ removeWithId:JavaLangLong_valueOfWithLong_(rid)];
  [((AMValueModel *) nil_chk([((AMGroupAvatarVM *) nil_chk([((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getGroupsModule])) getAvatarVMWithInt:gid])) getUploadState])) changeWithValue:new_AMAvatarUploadState_initWithNSString_withBoolean_(nil, NO)];
}

- (void)removeAvatarWithInt:(jint)gid {
  if ([((JavaUtilHashMap *) nil_chk(currentTasks_)) containsKeyWithId:JavaLangInteger_valueOfWithInt_(gid)]) {
    [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getFilesModule])) cancelUploadWithLong:[((JavaLangLong *) nil_chk([currentTasks_ getWithId:JavaLangInteger_valueOfWithInt_(gid)])) longLongValue]];
    (void) [currentTasks_ removeWithId:JavaLangInteger_valueOfWithInt_(gid)];
  }
  jlong rid = ImActorModelModulesUtilsRandomUtils_nextRid();
  (void) [currentTasks_ putWithId:JavaLangInteger_valueOfWithInt_(gid) withId:JavaLangLong_valueOfWithLong_(rid)];
  (void) [((JavaUtilHashMap *) nil_chk(tasksMap_)) putWithId:JavaLangLong_valueOfWithLong_(rid) withId:JavaLangInteger_valueOfWithInt_(gid)];
  AMGroup *group = [((id<DKKeyValueEngine>) nil_chk([((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getGroupsModule])) getGroups])) getValueWithKey:gid];
  APGroupOutPeer *outPeer = new_APGroupOutPeer_initWithInt_withLong_(gid, [((AMGroup *) nil_chk(group)) getAccessHash]);
  [((AMValueModel *) nil_chk([((AMOwnAvatarVM *) nil_chk([((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getProfile])) getOwnAvatarVM])) getUploadState])) changeWithValue:new_AMAvatarUploadState_initWithNSString_withBoolean_(nil, YES)];
  [self requestWithAPRequest:new_APRequestRemoveGroupAvatar_initWithAPGroupOutPeer_withLong_(outPeer, rid) withAMRpcCallback:new_ImActorModelModulesAvatarGroupAvatarChangeActor_$2_initWithImActorModelModulesAvatarGroupAvatarChangeActor_withInt_withLong_(self, gid, rid)];
}

- (void)onReceiveWithId:(id)message {
  if ([message isKindOfClass:[ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar class]]) {
    ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar *changeAvatar = (ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar *) check_class_cast(message, [ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar class]);
    [self changeAvatarWithInt:[((ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar *) nil_chk(changeAvatar)) getGid] withNSString:[changeAvatar getDescriptor]];
  }
  else if ([message isKindOfClass:[ImActorModelModulesFileUploadManager_UploadCompleted class]]) {
    ImActorModelModulesFileUploadManager_UploadCompleted *uploadCompleted = (ImActorModelModulesFileUploadManager_UploadCompleted *) check_class_cast(message, [ImActorModelModulesFileUploadManager_UploadCompleted class]);
    [self uploadCompletedWithLong:[((ImActorModelModulesFileUploadManager_UploadCompleted *) nil_chk(uploadCompleted)) getRid] withAMFileReference:[uploadCompleted getFileReference]];
  }
  else if ([message isKindOfClass:[ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged class]]) {
    ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged *avatarChanged = (ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged *) check_class_cast(message, [ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged class]);
    [self avatarChangedWithInt:[((ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged *) nil_chk(avatarChanged)) getGid] withLong:[avatarChanged getRid]];
  }
  else if ([message isKindOfClass:[ImActorModelModulesFileUploadManager_UploadError class]]) {
    ImActorModelModulesFileUploadManager_UploadError *uploadError = (ImActorModelModulesFileUploadManager_UploadError *) check_class_cast(message, [ImActorModelModulesFileUploadManager_UploadError class]);
    [self uploadErrorWithLong:[((ImActorModelModulesFileUploadManager_UploadError *) nil_chk(uploadError)) getRid]];
  }
  else if ([message isKindOfClass:[ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar class]]) {
    ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar *removeAvatar = (ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar *) check_class_cast(message, [ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar class]);
    [self removeAvatarWithInt:[((ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar *) nil_chk(removeAvatar)) getGid]];
  }
  else {
    [self dropWithId:message];
  }
}

@end

void ImActorModelModulesAvatarGroupAvatarChangeActor_initWithImActorModelModulesModules_(ImActorModelModulesAvatarGroupAvatarChangeActor *self, ImActorModelModulesModules *modules) {
  (void) ImActorModelModulesUtilsModuleActor_initWithImActorModelModulesModules_(self, modules);
  self->currentTasks_ = new_JavaUtilHashMap_init();
  self->tasksMap_ = new_JavaUtilHashMap_init();
}

ImActorModelModulesAvatarGroupAvatarChangeActor *new_ImActorModelModulesAvatarGroupAvatarChangeActor_initWithImActorModelModulesModules_(ImActorModelModulesModules *modules) {
  ImActorModelModulesAvatarGroupAvatarChangeActor *self = [ImActorModelModulesAvatarGroupAvatarChangeActor alloc];
  ImActorModelModulesAvatarGroupAvatarChangeActor_initWithImActorModelModulesModules_(self, modules);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarGroupAvatarChangeActor)

@implementation ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged

- (instancetype)initWithInt:(jint)gid
                   withLong:(jlong)rid {
  ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged_initWithInt_withLong_(self, gid, rid);
  return self;
}

- (jint)getGid {
  return gid_;
}

- (jlong)getRid {
  return rid_;
}

@end

void ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged_initWithInt_withLong_(ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged *self, jint gid, jlong rid) {
  (void) NSObject_init(self);
  self->gid_ = gid;
  self->rid_ = rid;
}

ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged *new_ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged_initWithInt_withLong_(jint gid, jlong rid) {
  ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged *self = [ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged alloc];
  ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged_initWithInt_withLong_(self, gid, rid);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged)

@implementation ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar

- (instancetype)initWithInt:(jint)gid
               withNSString:(NSString *)descriptor {
  ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar_initWithInt_withNSString_(self, gid, descriptor);
  return self;
}

- (jint)getGid {
  return gid_;
}

- (NSString *)getDescriptor {
  return descriptor_;
}

@end

void ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar_initWithInt_withNSString_(ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar *self, jint gid, NSString *descriptor) {
  (void) NSObject_init(self);
  self->gid_ = gid;
  self->descriptor_ = descriptor;
}

ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar *new_ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar_initWithInt_withNSString_(jint gid, NSString *descriptor) {
  ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar *self = [ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar alloc];
  ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar_initWithInt_withNSString_(self, gid, descriptor);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarGroupAvatarChangeActor_ChangeAvatar)

@implementation ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar

- (instancetype)initWithInt:(jint)gid {
  ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar_initWithInt_(self, gid);
  return self;
}

- (jint)getGid {
  return gid_;
}

@end

void ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar_initWithInt_(ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar *self, jint gid) {
  (void) NSObject_init(self);
  self->gid_ = gid;
}

ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar *new_ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar_initWithInt_(jint gid) {
  ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar *self = [ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar alloc];
  ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar_initWithInt_(self, gid);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarGroupAvatarChangeActor_RemoveAvatar)

@implementation ImActorModelModulesAvatarGroupAvatarChangeActor_$1

- (void)onResult:(APResponseEditGroupAvatar *)response {
  [((ImActorModelModulesUpdates *) nil_chk([this$0_ updates])) onUpdateReceivedWithId:new_ImActorModelApiBaseSeqUpdate_initWithInt_withByteArray_withInt_withByteArray_([((APResponseEditGroupAvatar *) nil_chk(response)) getSeq], [response getState], APUpdateGroupAvatarChanged_HEADER, [new_APUpdateGroupAvatarChanged_initWithInt_withLong_withInt_withAPAvatar_withLong_(val$gid_, val$rid_, [this$0_ myUid], [response getAvatar], [response getDate]) toByteArray])];
  [((ImActorModelModulesUpdates *) nil_chk([this$0_ updates])) onUpdateReceivedWithId:new_ImActorModelModulesUpdatesInternalExecuteAfter_initWithInt_withJavaLangRunnable_([response getSeq], new_ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_$1_(self))];
}

- (void)onError:(AMRpcException *)e {
  if (![((JavaUtilHashMap *) nil_chk(this$0_->tasksMap_)) containsKeyWithId:JavaLangLong_valueOfWithLong_(val$rid_)]) {
    return;
  }
  jint gid = [((JavaLangInteger *) nil_chk([this$0_->tasksMap_ getWithId:JavaLangLong_valueOfWithLong_(val$rid_)])) intValue];
  if ([((JavaLangLong *) nil_chk([((JavaUtilHashMap *) nil_chk(this$0_->currentTasks_)) getWithId:JavaLangInteger_valueOfWithInt_(gid)])) longLongValue] != val$rid_) {
    return;
  }
  (void) [this$0_->currentTasks_ removeWithId:JavaLangInteger_valueOfWithInt_(gid)];
  (void) [this$0_->tasksMap_ removeWithId:JavaLangLong_valueOfWithLong_(val$rid_)];
  [((AMValueModel *) nil_chk([((AMGroupAvatarVM *) nil_chk([((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk([this$0_ modules])) getGroupsModule])) getAvatarVMWithInt:gid])) getUploadState])) changeWithValue:new_AMAvatarUploadState_initWithNSString_withBoolean_(nil, NO)];
}

- (instancetype)initWithImActorModelModulesAvatarGroupAvatarChangeActor:(ImActorModelModulesAvatarGroupAvatarChangeActor *)outer$
                                                                withInt:(jint)capture$0
                                                               withLong:(jlong)capture$1 {
  ImActorModelModulesAvatarGroupAvatarChangeActor_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_withInt_withLong_(self, outer$, capture$0, capture$1);
  return self;
}

@end

void ImActorModelModulesAvatarGroupAvatarChangeActor_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_withInt_withLong_(ImActorModelModulesAvatarGroupAvatarChangeActor_$1 *self, ImActorModelModulesAvatarGroupAvatarChangeActor *outer$, jint capture$0, jlong capture$1) {
  self->this$0_ = outer$;
  self->val$gid_ = capture$0;
  self->val$rid_ = capture$1;
  (void) NSObject_init(self);
}

ImActorModelModulesAvatarGroupAvatarChangeActor_$1 *new_ImActorModelModulesAvatarGroupAvatarChangeActor_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_withInt_withLong_(ImActorModelModulesAvatarGroupAvatarChangeActor *outer$, jint capture$0, jlong capture$1) {
  ImActorModelModulesAvatarGroupAvatarChangeActor_$1 *self = [ImActorModelModulesAvatarGroupAvatarChangeActor_$1 alloc];
  ImActorModelModulesAvatarGroupAvatarChangeActor_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_withInt_withLong_(self, outer$, capture$0, capture$1);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarGroupAvatarChangeActor_$1)

@implementation ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1

- (void)run {
  [((DKActorRef *) nil_chk([this$0_->this$0_ self__])) sendWithId:new_ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged_initWithInt_withLong_(this$0_->val$gid_, this$0_->val$rid_)];
}

- (instancetype)initWithImActorModelModulesAvatarGroupAvatarChangeActor_$1:(ImActorModelModulesAvatarGroupAvatarChangeActor_$1 *)outer$ {
  ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_$1_(self, outer$);
  return self;
}

@end

void ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_$1_(ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1 *self, ImActorModelModulesAvatarGroupAvatarChangeActor_$1 *outer$) {
  self->this$0_ = outer$;
  (void) NSObject_init(self);
}

ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1 *new_ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_$1_(ImActorModelModulesAvatarGroupAvatarChangeActor_$1 *outer$) {
  ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1 *self = [ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1 alloc];
  ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_$1_(self, outer$);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarGroupAvatarChangeActor_$1_$1)

@implementation ImActorModelModulesAvatarGroupAvatarChangeActor_$2

- (void)onResult:(APResponseSeqDate *)response {
  [((ImActorModelModulesUpdates *) nil_chk([this$0_ updates])) onSeqUpdateReceivedWithInt:[((APResponseSeqDate *) nil_chk(response)) getSeq] withByteArray:[response getState] withAPUpdate:new_APUpdateGroupAvatarChanged_initWithInt_withLong_withInt_withAPAvatar_withLong_(val$gid_, val$rid_, [this$0_ myUid], nil, [response getDate])];
  [((ImActorModelModulesUpdates *) nil_chk([this$0_ updates])) onUpdateReceivedWithId:new_ImActorModelModulesUpdatesInternalExecuteAfter_initWithInt_withJavaLangRunnable_([response getSeq], new_ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_$2_(self))];
}

- (void)onError:(AMRpcException *)e {
  if (![((JavaUtilHashMap *) nil_chk(this$0_->tasksMap_)) containsKeyWithId:JavaLangLong_valueOfWithLong_(val$rid_)]) {
    return;
  }
  jint gid = [((JavaLangInteger *) nil_chk([this$0_->tasksMap_ getWithId:JavaLangLong_valueOfWithLong_(val$rid_)])) intValue];
  if ([((JavaLangLong *) nil_chk([((JavaUtilHashMap *) nil_chk(this$0_->currentTasks_)) getWithId:JavaLangInteger_valueOfWithInt_(gid)])) longLongValue] != val$rid_) {
    return;
  }
  (void) [this$0_->currentTasks_ removeWithId:JavaLangInteger_valueOfWithInt_(gid)];
  (void) [this$0_->tasksMap_ removeWithId:JavaLangLong_valueOfWithLong_(val$rid_)];
  [((AMValueModel *) nil_chk([((AMGroupAvatarVM *) nil_chk([((ImActorModelModulesGroups *) nil_chk([((ImActorModelModulesModules *) nil_chk([this$0_ modules])) getGroupsModule])) getAvatarVMWithInt:gid])) getUploadState])) changeWithValue:new_AMAvatarUploadState_initWithNSString_withBoolean_(nil, NO)];
}

- (instancetype)initWithImActorModelModulesAvatarGroupAvatarChangeActor:(ImActorModelModulesAvatarGroupAvatarChangeActor *)outer$
                                                                withInt:(jint)capture$0
                                                               withLong:(jlong)capture$1 {
  ImActorModelModulesAvatarGroupAvatarChangeActor_$2_initWithImActorModelModulesAvatarGroupAvatarChangeActor_withInt_withLong_(self, outer$, capture$0, capture$1);
  return self;
}

@end

void ImActorModelModulesAvatarGroupAvatarChangeActor_$2_initWithImActorModelModulesAvatarGroupAvatarChangeActor_withInt_withLong_(ImActorModelModulesAvatarGroupAvatarChangeActor_$2 *self, ImActorModelModulesAvatarGroupAvatarChangeActor *outer$, jint capture$0, jlong capture$1) {
  self->this$0_ = outer$;
  self->val$gid_ = capture$0;
  self->val$rid_ = capture$1;
  (void) NSObject_init(self);
}

ImActorModelModulesAvatarGroupAvatarChangeActor_$2 *new_ImActorModelModulesAvatarGroupAvatarChangeActor_$2_initWithImActorModelModulesAvatarGroupAvatarChangeActor_withInt_withLong_(ImActorModelModulesAvatarGroupAvatarChangeActor *outer$, jint capture$0, jlong capture$1) {
  ImActorModelModulesAvatarGroupAvatarChangeActor_$2 *self = [ImActorModelModulesAvatarGroupAvatarChangeActor_$2 alloc];
  ImActorModelModulesAvatarGroupAvatarChangeActor_$2_initWithImActorModelModulesAvatarGroupAvatarChangeActor_withInt_withLong_(self, outer$, capture$0, capture$1);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarGroupAvatarChangeActor_$2)

@implementation ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1

- (void)run {
  [((DKActorRef *) nil_chk([this$0_->this$0_ self__])) sendWithId:new_ImActorModelModulesAvatarGroupAvatarChangeActor_AvatarChanged_initWithInt_withLong_(this$0_->val$gid_, this$0_->val$rid_)];
}

- (instancetype)initWithImActorModelModulesAvatarGroupAvatarChangeActor_$2:(ImActorModelModulesAvatarGroupAvatarChangeActor_$2 *)outer$ {
  ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_$2_(self, outer$);
  return self;
}

@end

void ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_$2_(ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1 *self, ImActorModelModulesAvatarGroupAvatarChangeActor_$2 *outer$) {
  self->this$0_ = outer$;
  (void) NSObject_init(self);
}

ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1 *new_ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_$2_(ImActorModelModulesAvatarGroupAvatarChangeActor_$2 *outer$) {
  ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1 *self = [ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1 alloc];
  ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1_initWithImActorModelModulesAvatarGroupAvatarChangeActor_$2_(self, outer$);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarGroupAvatarChangeActor_$2_$1)
