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
#define SKInterFaceServer @"http://182.92.175.134:808/wt/"

#pragma mark 各类接口

/** 判断登录状态(每次启动app必须调用的接口) */
#define WoTing_EntryApp         (SKInterFaceServer@"common/entryApp.do")

/** 保存头像图片 */
#define WoTing_Upload4App         (SKInterFaceServer@"common/upload4App.do")

/** 登录 */
#define WoTing_Login      (SKInterFaceServer@"passport/user/mlogin.do")

/** 三方登录 */
#define WoTing_SanLogin     (SKInterFaceServer@"passport/user/afterThirdAuth.do")

/** 注销 */
#define WoTing_mlogout      (SKInterFaceServer@"passport/user/mlogout.do")

/** 注册 */
#define WoTing_register      (SKInterFaceServer@"passport/user/register.do")

/** 获取第一次验证码 */
#define WoTing_phone        (SKInterFaceServer@"passport/user/registerByPhoneNum.do")

/** 再次获取验证码 */
#define WoTing_yanZM        (SKInterFaceServer@"passport/user/reSendPhoneCheckCode.do")

/** 验证验证码  绑定手机号 */
#define WoTing_YanZhengbangDing     (SKInterFaceServer@"passport/user/checkPhoneCheckCode.do")

/** 通过手机号找回密码 */
#define WoTing_RetrieveByPhone       (SKInterFaceServer@"passport/user/retrieveByPhoneNum.do")

/** 修改密码 */
#define WoTing_ChangePwd    (SKInterFaceServer@"passport/user/updatePwd.do")

/** 修改用户信息 */
#define WoTing_UserInfo     (SKInterFaceServer@"passport/user/updateUserInfo.do")

/** 搜索陌生人 */
#define WoTing_SearchStranger         (SKInterFaceServer@"passport/friend/searchStranger.do")

/** 添加陌生人为好友 */
#define WoTing_FriendInvite       (SKInterFaceServer@"passport/friend/invite.do")

/** 删除好友 */
#define WoTing_DelFriend      (SKInterFaceServer@"passport/friend/delFriend.do")

/** 修改好友信息 */
#define WoTing_UpdateFriendInfo         (SKInterFaceServer@"passport/friend/updateFriendInfo.do")

/** 得到邀请我为好友的列表 */
#define WoTing_FriendInvitedList      (SKInterFaceServer@"passport/friend/getInvitedMeList.do")

/** 同意或拒绝添加好友邀请 */
#define WoTing_FriendInviteDeal      (SKInterFaceServer@"passport/friend/inviteDeal.do")

/** 享听 - 播放*/
#define WoTing_MainPage     (SKInterFaceServer@"mainPage.do")

/** 跳转后播放界面数据刷新 */
#define WoTing_searchBy           (SKInterFaceServer@"searchByText.do")

/** 享听 - 推荐 - 电台*/
#define WoTing_GetContents      (SKInterFaceServer@"content/getContents.do")

/** 享听 - 电台 - 城市列表 */
#define WoTing_getCatalogInfo    (SKInterFaceServer@"getCatalogInfo.do")

/** 享听 - 分类 */
#define WoTing_CatalogInfo      (SKInterFaceServer@"getPreferenceCatalog.do")

/** 享听 - 专辑 */
#define WoTing_GetContentInfo       (SKInterFaceServer@"content/getContentInfo.do")

/** 点击喜欢 */
#define WoTing_like         (SKInterFaceServer@"content/clickFavorite.do")

/** 喜欢列表 */
#define WoTing_likeList         (SKInterFaceServer@"content/getFavoriteList.do")

/** 节目单数据 */
#define WoTing_JMD          (SKInterFaceServer@"content/getBCProgramme.do")

/** 获取评论列表 */
#define WoTing_PLgetList        (SKInterFaceServer@"discuss/article/getList.do")

/** 添加评论 */
#define WoTing_PLget        (SKInterFaceServer@"discuss/add.do")

/** 得到热门搜索 */
#define WoTing_HotKeys      (SKInterFaceServer@"getHotKeys.do")

/** 搜索内容 */
#define WoTing_searchHotKeys    (SKInterFaceServer@"searchHotKeys.do")

/** 提交反馈 */
#define WoTing_FanKui       (SKInterFaceServer@"opinion/app/commit.do")

/** 举报接口 */
#define WoTing_JuBao    (SKInterFaceServer@"content/accuse.do")

/** 轮播图 */
#define WoTing_LunBo    (SKInterFaceServer@"content/getLoopImgs.do")

/** 点击订阅 */
#define WoTing_DingYue      (SKInterFaceServer@"content/clickSubscribe.do")

/** 订阅节目列表 */
#define WoTing_DingYueList  (SKInterFaceServer@"content/getSubscribeList.do")

/** 得到主播信息 */
#define WoTing_ZhuBo    (SKInterFaceServer@"person/getPersonInfo.do")

/** 得到主播内容 */
#define WoTing_ZhuBoList    (SKInterFaceServer@"person/getPersonContents.do")

/** 设置偏好 */
#define WoTing_SetPreference   (SKInterFaceServer@"setPreference.do")


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
