//
//  httpHeader.h
//  WoTingfm
//
//  Created by hyc on 2017/6/5.
//  Copyright © 2017年 jq. All rights reserved.
//

#ifndef httpHeader_h
#define httpHeader_h



#pragma mark - 数据请求接口

/** 外网接口地址 */
//#define SKInterFaceServer @"http://123.56.254.75:808/wt/"
#define SKInterFaceServer @"http://api.wotingfm.com/"

#pragma mark 各类接口

/*------------------------------登录部分接口------------------------------------*/

/** 登录 */
#define WoTing_Login      (SKInterFaceServer@"api/accounts/login")

/** 注册 */
#define WoTing_register      (SKInterFaceServer@"api/accounts/register")

/** 获取验证码 */
#define WoTing_yanZM        (SKInterFaceServer@"api/accounts/verify-codes")

/** 忘记密码重置*/
#define WoTing_ChangePwd    (SKInterFaceServer@"api/accounts/reset-passwords")


/*------------------------------听部分接口------------------------------------*/

/** 首页(精选) */
#define WoTing_ListeningSelection     (SKInterFaceServer@"api/listenings/selections")

/** 首页(打开即播放) */
#define WoTing_ListeningPlayer    (SKInterFaceServer@"api/listenings/player")

/*------------------------------讲部分接口----------------------------------*/

/** 创建用户组 */
#define WoTing_buildGroup       (SKInterFaceServer@"passport/group/buildGroup.do")

/** 获取组成员*/
#define WoTing_GroupMembers       (SKInterFaceServer@"passport/group/getGroupMembers.do")

/** 得到被邀请的用户组的信息 */
#define WoTing_GetInviteMeList             (SKInterFaceServer@"passport/group/getInviteMeList.do")

/** 邀请好友入组 */
#define WoTing_GroupInvite       (SKInterFaceServer@"passport/group/groupInvite.do")

/** 同意或拒绝邀请入组信息(新的朋友) */
#define WoTing_InviteDeal         (SKInterFaceServer@"passport/group/inviteDeal.do")

/** 用户主动退出组 */
#define WoTing_ExitGroup       (SKInterFaceServer@"/passport/group/exitGroup.do")

/** 删除群成员(管理) */
#define WoTing_KickoutGroup     (SKInterFaceServer@"passport/group/kickoutGroup.do")

/** 群主设置管理员(可新增, 可删除) */
#define WoTing_SetGroupAdmin         (SKInterFaceServer@"passport/group/setGroupAdmin.do")

/** 获取群组通讯录 */
#define WoTing_GroupsAndFriends     (SKInterFaceServer@"passport/getGroupsAndFriends.do")

/** 加入群组(公开群/密码群) */
#define WoTing_JoinInGroup         (SKInterFaceServer@"passport/group/joinInGroup.do")

/** 申请入组 */
#define WoTing_GroupApply   (SKInterFaceServer@"passport/group/groupApply.do")

/** 得到组的申请人列表(加群消息) */
#define WoTing_GetApplyUserList        (SKInterFaceServer@"passport/group/getApplyUserList.do")

/** 得到需要我审核的用户邀请信息*/
#define WoTing_GetNeedCheckInviteUserGroupList     (SKInterFaceServer@"passport/group/getNeedCheckInviteUserGroupList.do")

/** 得到有未处理申请人的我所管理的用户组(审核消息) */
#define WoTing_GetExistApplyUserGroupList         (SKInterFaceServer@"passport/group/getExistApplyUserGroupList.do")

/** 接受或拒绝申请组信息(加群消息) */
#define WoTing_ApplyDeal         (SKInterFaceServer@"passport/group/applyDeal.do")

/** 群组搜索 */
#define WoTing_SearchGroup     (SKInterFaceServer@"passport/group/searchGroup.do")


/** 修改群资料 */
#define WoTing_UpdateGroup        (SKInterFaceServer@"passport/group/updateGroup.do")

/** 移交群主权限 */
#define WoTing_ChangGuoupMaster      (SKInterFaceServer@"passport/group/changGroupMaster.do")

/** 修改群密码 */
#define WoTing_UpdatePwd        (SKInterFaceServer@"passport/group/updatePwd.do")

#endif /* httpHeader_h */
