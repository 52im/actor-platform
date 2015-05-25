//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/parser/UpdatesParser.java
//


#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/parser/UpdatesParser.h"
#include "im/actor/model/api/updates/UpdateCallEnd.h"
#include "im/actor/model/api/updates/UpdateCallRing.h"
#include "im/actor/model/api/updates/UpdateChatClear.h"
#include "im/actor/model/api/updates/UpdateChatDelete.h"
#include "im/actor/model/api/updates/UpdateConfig.h"
#include "im/actor/model/api/updates/UpdateContactRegistered.h"
#include "im/actor/model/api/updates/UpdateContactsAdded.h"
#include "im/actor/model/api/updates/UpdateContactsRemoved.h"
#include "im/actor/model/api/updates/UpdateGroupAvatarChanged.h"
#include "im/actor/model/api/updates/UpdateGroupInvite.h"
#include "im/actor/model/api/updates/UpdateGroupMembersUpdate.h"
#include "im/actor/model/api/updates/UpdateGroupOnline.h"
#include "im/actor/model/api/updates/UpdateGroupTitleChanged.h"
#include "im/actor/model/api/updates/UpdateGroupUserAdded.h"
#include "im/actor/model/api/updates/UpdateGroupUserKick.h"
#include "im/actor/model/api/updates/UpdateGroupUserLeave.h"
#include "im/actor/model/api/updates/UpdateMessage.h"
#include "im/actor/model/api/updates/UpdateMessageContentChanged.h"
#include "im/actor/model/api/updates/UpdateMessageDateChanged.h"
#include "im/actor/model/api/updates/UpdateMessageDelete.h"
#include "im/actor/model/api/updates/UpdateMessageRead.h"
#include "im/actor/model/api/updates/UpdateMessageReadByMe.h"
#include "im/actor/model/api/updates/UpdateMessageReceived.h"
#include "im/actor/model/api/updates/UpdateMessageSent.h"
#include "im/actor/model/api/updates/UpdateParameterChanged.h"
#include "im/actor/model/api/updates/UpdateTyping.h"
#include "im/actor/model/api/updates/UpdateUserAvatarChanged.h"
#include "im/actor/model/api/updates/UpdateUserContactsChanged.h"
#include "im/actor/model/api/updates/UpdateUserLastSeen.h"
#include "im/actor/model/api/updates/UpdateUserLocalNameChanged.h"
#include "im/actor/model/api/updates/UpdateUserNameChanged.h"
#include "im/actor/model/api/updates/UpdateUserOffline.h"
#include "im/actor/model/api/updates/UpdateUserOnline.h"
#include "im/actor/model/network/parser/BaseParser.h"
#include "im/actor/model/network/parser/Update.h"
#include "java/io/IOException.h"

@implementation ImActorModelApiParserUpdatesParser

- (APUpdate *)readWithInt:(jint)type
            withByteArray:(IOSByteArray *)payload {
  switch (type) {
    case 16:
    return APUpdateUserAvatarChanged_fromBytesWithByteArray_(payload);
    case 32:
    return APUpdateUserNameChanged_fromBytesWithByteArray_(payload);
    case 51:
    return APUpdateUserLocalNameChanged_fromBytesWithByteArray_(payload);
    case 134:
    return APUpdateUserContactsChanged_fromBytesWithByteArray_(payload);
    case 5:
    return APUpdateContactRegistered_fromBytesWithByteArray_(payload);
    case 40:
    return APUpdateContactsAdded_fromBytesWithByteArray_(payload);
    case 41:
    return APUpdateContactsRemoved_fromBytesWithByteArray_(payload);
    case 55:
    return APUpdateMessage_fromBytesWithByteArray_(payload);
    case 162:
    return APUpdateMessageContentChanged_fromBytesWithByteArray_(payload);
    case 163:
    return APUpdateMessageDateChanged_fromBytesWithByteArray_(payload);
    case 4:
    return APUpdateMessageSent_fromBytesWithByteArray_(payload);
    case 54:
    return APUpdateMessageReceived_fromBytesWithByteArray_(payload);
    case 19:
    return APUpdateMessageRead_fromBytesWithByteArray_(payload);
    case 50:
    return APUpdateMessageReadByMe_fromBytesWithByteArray_(payload);
    case 46:
    return APUpdateMessageDelete_fromBytesWithByteArray_(payload);
    case 47:
    return APUpdateChatClear_fromBytesWithByteArray_(payload);
    case 48:
    return APUpdateChatDelete_fromBytesWithByteArray_(payload);
    case 36:
    return APUpdateGroupInvite_fromBytesWithByteArray_(payload);
    case 21:
    return APUpdateGroupUserAdded_fromBytesWithByteArray_(payload);
    case 23:
    return APUpdateGroupUserLeave_fromBytesWithByteArray_(payload);
    case 24:
    return APUpdateGroupUserKick_fromBytesWithByteArray_(payload);
    case 44:
    return APUpdateGroupMembersUpdate_fromBytesWithByteArray_(payload);
    case 38:
    return APUpdateGroupTitleChanged_fromBytesWithByteArray_(payload);
    case 39:
    return APUpdateGroupAvatarChanged_fromBytesWithByteArray_(payload);
    case 6:
    return APUpdateTyping_fromBytesWithByteArray_(payload);
    case 7:
    return APUpdateUserOnline_fromBytesWithByteArray_(payload);
    case 8:
    return APUpdateUserOffline_fromBytesWithByteArray_(payload);
    case 9:
    return APUpdateUserLastSeen_fromBytesWithByteArray_(payload);
    case 33:
    return APUpdateGroupOnline_fromBytesWithByteArray_(payload);
    case 49:
    return APUpdateCallRing_fromBytesWithByteArray_(payload);
    case 83:
    return APUpdateCallEnd_fromBytesWithByteArray_(payload);
    case 131:
    return APUpdateParameterChanged_fromBytesWithByteArray_(payload);
    case 42:
    return APUpdateConfig_fromBytesWithByteArray_(payload);
  }
  @throw new_JavaIoIOException_init();
}

- (instancetype)init {
  ImActorModelApiParserUpdatesParser_init(self);
  return self;
}

@end

void ImActorModelApiParserUpdatesParser_init(ImActorModelApiParserUpdatesParser *self) {
  (void) APBaseParser_init(self);
}

ImActorModelApiParserUpdatesParser *new_ImActorModelApiParserUpdatesParser_init() {
  ImActorModelApiParserUpdatesParser *self = [ImActorModelApiParserUpdatesParser alloc];
  ImActorModelApiParserUpdatesParser_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiParserUpdatesParser)
