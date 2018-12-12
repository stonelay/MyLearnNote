
## 格式化
clang-format 

## lint
1. clone repo
2. update podfile.local
3. // update pod
env PODFILE_TYPE=DEV pod update
4. 
// 当前组件库中
bbsp lint --no-clean

5. 提交
git push origin dev/3.18.0:feature/t


* HBIOC_ConfigCenter
* xxIM
* lifecycle
* model InBo

scene_item_promotion_top
scene_item_belt


it fetch origin master:tmp //从远程仓库master分支获取最新，在本地建立tmp分支
git diff tmp //將當前分支和tmp進行對比
git merge tmp //合并tmp分支到当前分支




https://gems.ruby-china.com/






file:///Users/zhanglei/Library/Developer/CoreSimulator/Devices/75DA7503-0974-4D56-BE0D-E4D5430F73C7/data/Containers/Bundle/Application/F2AD65CC-67BE-45B1-AC27-CB640EFD587F/beidian.app/.ALL_TARGETS.yml [via HBLog]


{
	key = B4TK0N0sOjpBQNM1yvtfJQ==,
	secret = xRaCvxuV9gOTSzm4Wy5CLucBZtJ9ECdGab+tJBoHM0L9cLX4sCTwo5+AkWJpLAjEGGlswXRfLxFCjb4b6zV+QQFYu47AJyhX6ORE9n8SBfxFQcQX7hHfrTjqiXMopWxG,
	__SECURE = 1,
	iv = SeMGkRyUJ8IY/T13k7fWHg==
} [via HBLog]








2018-12-11 16:54:59.350775+0800 beidian[21871:1546688] Security -==- {
    "__SECURE" = 1;
    iv = "SeMGkRyUJ8IY/T13k7fWHg==";
    key = "B4TK0N0sOjpBQNM1yvtfJQ==";
    secret = "xRaCvxuV9gOTSzm4Wy5CLucBZtJ9ECdGab+tJBoHM0L9cLX4sCTwo5+AkWJpLAjEGGlswXRfLxFCjb4b6zV+QQFYu47AJyhX6ORE9n8SBfxFQcQX7hHfrTjqiXMopWxG";
}
2018-12-11 16:54:59.351526+0800 beidian[21871:1546688] HotFix -==- {
    "hotfix_debug_enabled" = 1;
    "request_method" = "beidian.app.config.get";
    "request_module" = "beidian_user_activity";
}
kHBConfigUpdateNotification
2018-12-11 16:54:59.353396+0800 beidian[21871:1546688] IoC -==- {
    BBEnvironmentProtocol = "HBEnvironment.sharedInstance";
    BDShareBoardProtocol = "BDShareBoardManager.class";
    BDShareImagesPrefetcher = "BDSystemShareImagesPrefetcher.class";
    HBConfigCenterProtocol = "HBConfigCenter.sharedInstance";
    HBDynamicInterpreterProtocol = "BangBang.sharedInstance";
    HBEnvironmentProtocol = "HBEnvironment.sharedInstance";
    HBFPSMonitorProtocol = "HBFpsMonitor.sharedInstance";
    HBHusorClickProtocol = "HusorClick.instance";
    HBLoadingSpinnerViewProtocol = "HBLoadingSpinnerView.class";
    HBNavigatorProtocol = "BBNavigator.instance";
    HBShareProtocol = "BBShare.class";
    HBUpdateEngineProtocol = "HBUpdateEngine.sharedInstance";
    HBUpgradePrompterProtocol = "HBUpgradePrompter.sharedInstance";
}
2018-12-11 16:54:59.356037+0800 beidian[21871:1546688] CrashReporter -==- (null)
2018-12-11 16:54:59.358833+0800 beidian[21871:1546688] CrashFucker -==- {
    enabled = 1;
}
2018-12-11 16:54:59.361420+0800 beidian[21871:1546688] SafeAccess -==- {
    "safe_access_all_protect" = 0;
}
2018-12-11 16:54:59.361765+0800 beidian[21871:1546688] LogReporter -==- {
    endpoint = "http://n.beibei.com/n3.gif";
    "flush_count" = 20;
}
2018-12-11 16:54:59.362781+0800 beidian[21871:1546688] DebugConsole -==- (null)
2018-12-11 16:54:59.363407+0800 beidian[21871:1546688] BaseViewController -==- {
    "network_diagnosis" =     {
        bundle = HBNetworking;
        file = "network_diagnosis.html";
    };
}
2018-12-11 16:54:59.363607+0800 beidian[21871:1546688] AutoHTTPS -==- (null)
2018-12-11 16:54:59.364091+0800 beidian[21871:1546688] HTTPDNS -==- {
    ip = "119.29.29.29";
    type = 1;
}
2018-12-11 16:54:59.364664+0800 beidian[21871:1546688] BadgeMessage -==- {
    "badge_message_method" = "beidian.user.badge.get";
}
2018-12-11 16:54:59.365145+0800 beidian[21871:1546688] UpdateApp -==- {
    "alert_max_times" = 9;
    "api_url" = "http://au.beibei.com/api/ios/beidian";
    version = "3.20.00";
}
2018-12-11 16:54:59.369213+0800 beidian[21871:1546688] HybridPlugin -==- {
    actionSheet = BBHTActionSheet;
    activityPay = BDHActivityPay;
    addBrandCoupon = BBHTAddBrandCoupon;
    addFavor = BBHTAddFavor;
    ajax = BBHTAjax;
    alert = BBHTAlert;
    apolloTest = HBHTApolloTest;
    appsRecommend = BBHTAppsRecommend;
    appsScore = BBHTAppsScore;
    bankCardOcr = BDHTBankCardOcr;
    bdBrowseImages = BDHybridBrowseImages;
    bdChangeContainerTab = BDHChangeContainerTab;
    bdDeviceInfo = BDHDeviceInfoGet;
    bdGetContactList = BDHTGetContactList;
    browseImages = BBHTBrowseImages;
    canOpenAlipay = BBPayCanOpenAlipayHybrid;
    cancelLiveAlarm = BBHTCancelLiveAlarm;
    certificateDownload = BDCertificateDownload;
    changeTitle = BBHTChangeTitle;
    checkAppInstall = BBHTCheckAppInstall;
    checkAppsInstall = BBHTCheckAppsInstall;
    checkLogin = BBHTCheckLogin;
    checkinAlarm = BBHTCheckinAlarm;
    clientInfo = BBHTClientInfo;
    close = BBHTClose;
    closeMemberCard = BBHybridCloseMemberCard;
    closePoplayer = HBHybridClosePoplayer;
    config = HBHybridToolConfig;
    confirm = BBHTConfirm;
    copy = BBHTCopy;
    customGoToTopButton = HBHybridToolCustomGoToTopButton;
    customNavBarRightBtn = BBHTCustomNavBarRightBtn;
    datePicker = BBHTDatePicker;
    deleteDoc = BBHTDeleteDoc;
    deviceInfo = BDHTDeviceInfo;
    disablePullToRefresh = BBHTDisablePullToRefresh;
    dismissLoading = BBHTDismissLoading;
    finishMemberGame = HBHybridFinishedGamePlayer;
    flushBrowseHistory = BBHTFlushBrowseHistory;
    generateWeexSnapshot = HBHTWeexImageGenerator;
    getContact = HBHTGetContact;
    getLiveAlarmkeys = BBHTGetLiveAlarmKeys;
    getLocation = BBHTGetLocation;
    getOriginUrl = BBHTGetOriginUrl;
    getPhoneNumber = BBHTGetPhoneNumber;
    getStorage = BBHTGetStorage;
    getSystemState = HBHTGetSystemState;
    getUserInfo = HBHybridGetUserInfo;
    handleRemind = BDHybridHandleRemind;
    hasBrandCoupon = BBHTHasBrandCoupon;
    hasFavor = BBHTHasFavor;
    hideBackButton = BDHybridHideBackButton;
    hideKeyboard = BDHybridHideKeyboard;
    hideLiveComment = BBHTHideLiveComment;
    hideLiveProduct = BBHTHideLiveProduct;
    hybridNotification = HBHybridNotification;
    idCard = BDHAuthCardImageUploader;
    isCached = HBHybridToolIsCached;
    liveness = BDHAuthLivenessImageUploader;
    logEvent = BBHTLogEvent;
    login = BBHTLogin;
    lookupDN = HBHybridToolLookupDN;
    networkDiagnosis = HBHybridToolNetworkDiagnosis;
    onClose = BBHTOnClose;
    openCommentOrder = BDHybridBackToCommentOrder;
    openPoplayer = HBHybridOpenPoplayer;
    openURL = BBHTOpenURL;
    openURLWithClose = BDHybridOpenURLWithClose;
    openURLWithRefresh = BDHybridOpenURLWithRefresh;
    panbackGesture = BBHTPanbackGesture;
    paste = BBHTPaste;
    payPwd = BDHybridPayPassword;
    personalInfoAuth = HBHybridPersonalInfoAuth;
    playSound = BBHTPlaySound;
    playVideo = BBHTPlayVideo;
    postComment = BBHTPostComment;
    postScreenshot = HBHTPostScreenshot;
    queryRemind = BDHybridQueryRemind;
    readDoc = BBHTReadDoc;
    refresh = BBHTRefresh;
    refreshUserInfo = BBHTRefreshUserInfo;
    removeFavor = BBHTRemoveFavor;
    resetHeight = BBHTResetHeight;
    saveChatWindow = BHHybridSaveChatWindow;
    scanCode = BBHTScanCode;
    scanTrackingNumber = BDHybridScanTrackingNumber;
    sendNotification = HBHTSendNotification;
    sendSMS = BBHTSendSMS;
    serverTime = BBHTServerTime;
    setLiveAlarm = BBHTSetLiveAlarm;
    setPageResult = BBHTSetPageResult;
    setPoplayer = HBHybridSetPoplayer;
    setStorage = BBHTSetStorage;
    setWebViewHeight = BBHTSetWebViewHeight;
    shake = BBHTShake;
    share = BBHTShare;
    shareBoard = BDHybridShareBoard;
    sharePoster = BDHybridSharePoster;
    shareToast = HBHybridShareShow;
    showCSPushMessage = BBHTShowCSPushMessage;
    showKeyboard = BDHybridShowKeyboard;
    showLiveComment = BBHTShowLiveComment;
    showLiveProduct = BBHTShowLiveProduct;
    showLoading = BBHTShowLoading;
    showSaveToAlbum = HBHybridActionShowSaveToAlbum;
    showToast = BBHTShowToast;
    switchTab = BBHTSwitchTab;
    toggleBounce = HBHTToggleBounce;
    toggleNavigatorRightButton = HBHybridToggleNavigatorRightButton;
    tradeConfirm = BBHTTradeConfirm;
    updateLike = BBHTUpdateLike;
    updateLiveLike = BBHTUpdateLiveLike;
    updateLiveViews = BBHTUpdateLiveViews;
    uploadCardImage = BDHTAuthImageUpload;
    uploadImage = BBHTUploadImage;
    uploadLogFiles = HBHybridToolUploadLogFiles;
    uploadManyImages = HBMultipleImagesPicker;
    uploadMultiImage = BBHTMultipleImagesUploader;
    vibrate = HBHTVibrate;
    weexRegisterBusinessID = HBWXHybridToolRegisterBusinessID;
    writeDoc = BBHTWriteDoc;
}
2018-12-11 16:54:59.372399+0800 beidian[21871:1546688] Autumn -==- {
    hybrid =     {
        actionSheet = BBHTActionSheet;
        activityPay = BDHActivityPay;
        addBrandCoupon = BBHTAddBrandCoupon;
        addFavor = BBHTAddFavor;
        ajax = BBHTAjax;
        alert = BBHTAlert;
        apolloTest = HBHTApolloTest;
        appsRecommend = BBHTAppsRecommend;
        appsScore = BBHTAppsScore;
        bankCardOcr = BDHTBankCardOcr;
        bdBrowseImages = BDHybridBrowseImages;
        bdChangeContainerTab = BDHChangeContainerTab;
        bdDeviceInfo = BDHDeviceInfoGet;
        bdGetContactList = BDHTGetContactList;
        browseImages = BBHTBrowseImages;
        canOpenAlipay = BBPayCanOpenAlipayHybrid;
        cancelLiveAlarm = BBHTCancelLiveAlarm;
        certificateDownload = BDCertificateDownload;
        changeTitle = BBHTChangeTitle;
        checkAppInstall = BBHTCheckAppInstall;
        checkAppsInstall = BBHTCheckAppsInstall;
        checkLogin = BBHTCheckLogin;
        checkinAlarm = BBHTCheckinAlarm;
        clientInfo = BBHTClientInfo;
        close = BBHTClose;
        closeMemberCard = BBHybridCloseMemberCard;
        closePoplayer = HBHybridClosePoplayer;
        config = HBHybridToolConfig;
        confirm = BBHTConfirm;
        copy = BBHTCopy;
        customGoToTopButton = HBHybridToolCustomGoToTopButton;
        customNavBarRightBtn = BBHTCustomNavBarRightBtn;
        datePicker = BBHTDatePicker;
        deleteDoc = BBHTDeleteDoc;
        deviceInfo = BDHTDeviceInfo;
        disablePullToRefresh = BBHTDisablePullToRefresh;
        dismissLoading = BBHTDismissLoading;
        finishMemberGame = HBHybridFinishedGamePlayer;
        flushBrowseHistory = BBHTFlushBrowseHistory;
        generateWeexSnapshot = HBHTWeexImageGenerator;
        getContact = HBHTGetContact;
        getLiveAlarmkeys = BBHTGetLiveAlarmKeys;
        getLocation = BBHTGetLocation;
        getOriginUrl = BBHTGetOriginUrl;
        getPhoneNumber = BBHTGetPhoneNumber;
        getStorage = BBHTGetStorage;
        getSystemState = HBHTGetSystemState;
        getUserInfo = HBHybridGetUserInfo;
        handleRemind = BDHybridHandleRemind;
        hasBrandCoupon = BBHTHasBrandCoupon;
        hasFavor = BBHTHasFavor;
        hideBackButton = BDHybridHideBackButton;
        hideKeyboard = BDHybridHideKeyboard;
        hideLiveComment = BBHTHideLiveComment;
        hideLiveProduct = BBHTHideLiveProduct;
        hybridNotification = HBHybridNotification;
        idCard = BDHAuthCardImageUploader;
        isCached = HBHybridToolIsCached;
        liveness = BDHAuthLivenessImageUploader;
        logEvent = BBHTLogEvent;
        login = BBHTLogin;
        lookupDN = HBHybridToolLookupDN;
        networkDiagnosis = HBHybridToolNetworkDiagnosis;
        onClose = BBHTOnClose;
        openCommentOrder = BDHybridBackToCommentOrder;
        openPoplayer = HBHybridOpenPoplayer;
        openURL = BBHTOpenURL;
        openURLWithClose = BDHybridOpenURLWithClose;
        openURLWithRefresh = BDHybridOpenURLWithRefresh;
        panbackGesture = BBHTPanbackGesture;
        paste = BBHTPaste;
        payPwd = BDHybridPayPassword;
        personalInfoAuth = HBHybridPersonalInfoAuth;
        playSound = BBHTPlaySound;
        playVideo = BBHTPlayVideo;
        postComment = BBHTPostComment;
        postScreenshot = HBHTPostScreenshot;
        queryRemind = BDHybridQueryRemind;
        readDoc = BBHTReadDoc;
        refresh = BBHTRefresh;
        refreshUserInfo = BBHTRefreshUserInfo;
        removeFavor = BBHTRemoveFavor;
        resetHeight = BBHTResetHeight;
        saveChatWindow = BHHybridSaveChatWindow;
        scanCode = BBHTScanCode;
        scanTrackingNumber = BDHybridScanTrackingNumber;
        sendNotification = HBHTSendNotification;
        sendSMS = BBHTSendSMS;
        serverTime = BBHTServerTime;
        setLiveAlarm = BBHTSetLiveAlarm;
        setPageResult = BBHTSetPageResult;
        setPoplayer = HBHybridSetPoplayer;
        setStorage = BBHTSetStorage;
        setWebViewHeight = BBHTSetWebViewHeight;
        shake = BBHTShake;
        share = BBHTShare;
        shareBoard = BDHybridShareBoard;
        sharePoster = BDHybridSharePoster;
        shareToast = HBHybridShareShow;
        showCSPushMessage = BBHTShowCSPushMessage;
        showKeyboard = BDHybridShowKeyboard;
        showLiveComment = BBHTShowLiveComment;
        showLiveProduct = BBHTShowLiveProduct;
        showLoading = BBHTShowLoading;
        showSaveToAlbum = HBHybridActionShowSaveToAlbum;
        showToast = BBHTShowToast;
        switchTab = BBHTSwitchTab;
        toggleBounce = HBHTToggleBounce;
        toggleNavigatorRightButton = HBHybridToggleNavigatorRightButton;
        tradeConfirm = BBHTTradeConfirm;
        updateLike = BBHTUpdateLike;
        updateLiveLike = BBHTUpdateLiveLike;
        updateLiveViews = BBHTUpdateLiveViews;
        uploadCardImage = BDHTAuthImageUpload;
        uploadImage = BBHTUploadImage;
        uploadLogFiles = HBHybridToolUploadLogFiles;
        uploadManyImages = HBMultipleImagesPicker;
        uploadMultiImage = BBHTMultipleImagesUploader;
        vibrate = HBHTVibrate;
        weexRegisterBusinessID = HBWXHybridToolRegisterBusinessID;
        writeDoc = BBHTWriteDoc;
    };
    placeholder =     {
        large = "img_loading_large";
        middle = "img_loading_middle";
        small = "img_loading_small";
        xsmall = "img_loading_xsmall";
    };
    templates =     {
        "beidian_aftersale" =         (
            "as_online_service",
            "as_recipients",
            "as_tag_bottom_blank",
            "as_tag_common_text",
            "as_tag_info_img",
            "as_tag_line",
            "as_tag_mail_code_button",
            "as_tag_middle_blank",
            "as_tag_refund_info_text",
            "as_tag_special_color_text",
            "as_tag_special_text",
            "as_tag_sub_address_title",
            "as_tag_sub_blank",
            "as_tag_sub_bottom_blank",
            "as_tag_sub_info_text",
            "as_tag_sub_line",
            "as_tag_sub_name_phone",
            "as_tag_sub_refund_code",
            "as_tag_sub_refund_title",
            "as_tag_timer_text",
            "as_tag_title",
            "as_tag_title_timer",
            "as_time_line"
        );
    };
}
2018-12-11 16:54:59.374483+0800 beidian[21871:1546688] HybridCache -==- {
    "api_url" = "http://sapi.beibei.com/beidian/hybrid/cache_json.html";
}
2018-12-11 16:54:59.377148+0800 beidian[21871:1546688] Navigator -==- {
    targets =     {
        BBActivityViewController =         {
            login = true;
            targets =             (
                "bb/c2c/activity"
            );
        };
        BBAddAddressViewController =         {
            targets =             (
                "bb/user/add_delivery_address"
            );
        };
        BBAddressesViewController =         {
            login = true;
            targets =             (
                "bb/user/delivery_address"
            );
        };
        BBAfterSalesCheckViewController =         {
            targets =             (
                "bb/trade/refund_check"
            );
        };
        BBAfterSalesViewController =         {
            login = true;
            targets =             (
                "refund_list",
                "bb/trade/refund_list"
            );
        };
        BBBankListViewController =         {
            targets =             (
                "bb/trade/bank_list"
            );
            title = "\U9009\U62e9\U94f6\U884c";
        };
        BBC2CMessageCenterViewController =         {
            login = true;
            targets =             (
                message,
                "bb/c2c/message",
                "bd/message/home"
            );
        };
        BBC2CMessagesCommentViewController =         {
            targets =             (
                "bb/c2c/messages_comment"
            );
        };
        BBC2CMessagesFollowViewController =         {
            targets =             (
                "bb/c2c/messages_follow"
            );
        };
        BBC2CMessagesLikeViewController =         {
            targets =             (
                "bb/c2c/messages_like"
            );
        };
        BBC2CMessagesViewController =         {
            targets =             (
                "bb/c2c/messages_super"
            );
        };
        BBCashCouponViewController =         {
            targets =             (
                "bb/trade/cash_coupon"
            );
            title = "\U73b0\U91d1\U5238";
        };
        BBChangeOrderAddressViewController =         {
            targets =             (
                "bb/trade/change_order_address",
                "bb/trade/change_address"
            );
        };
        BBCustomerViewController =         {
            targets =             (
                "bb/base/customer"
            );
        };
        BBIMChatViewController =         {
            login = true;
            targets =             (
                "bb/im/chat",
                "bb/im/newchat"
            );
        };
        BBImagePickerViewController =         {
            targets =             (
                "bb/base/image_picker"
            );
        };
        BBInvoiceFormViewController =         {
            targets =             (
                "bd/trade/invoice_info"
            );
            title = "\U53d1\U7968\U4fe1\U606f";
        };
        BBMessageCenterViewController =         {
            login = true;
            targets =             (
                "bb/c2c/message_center"
            );
        };
        BBMessageDetailViewController =         {
            login = true;
            targets =             (
                "bb/c2c/message_detail"
            );
        };
        BBNewAftersaleDetailViewController =         {
            targets =             (
                "refund_detail",
                "bb/trade/refund_detail"
            );
        };
        BBNewApplyAfterSaleViewController =         {
            login = true;
            targets =             (
                "bb/trade/apply_refund"
            );
        };
        BBNewTrackViewController =         {
            targets =             (
                "bb/trade/shippment_check"
            );
        };
        BBOrderDetailViewController =         {
            login = true;
            targets =             (
                "order_detail",
                "bb/trade/order_detail"
            );
            title = "\U8ba2\U5355\U8be6\U60c5";
        };
        BBOrderListSearchResultViewController =         {
            targets =             (
                "bb/trade/order_search_result"
            );
        };
        BBOrderListSearchViewController =         {
            targets =             (
                "bb/trade/order_search"
            );
        };
        BBOrderListViewController =         {
            login = true;
            targets =             (
                "bb/trade/order_list",
                "order_list"
            );
            title = "\U6211\U7684\U8ba2\U5355";
        };
        BBOrderRefundReasonViewController =         {
            targets =             (
                "bb/trade/refound_type"
            );
        };
        BBOverseaCredentialListController =         {
            login = true;
            targets =             (
                "bb/oversea/credential_list",
                "bb/user/credential_list"
            );
        };
        BBOverseaCredentialViewController =         {
            login = true;
            targets =             (
                "bb/oversea/credential"
            );
        };
        BBOverseaIdentityViewController =         {
            login = true;
            targets =             (
                "bb/user/edit_credential",
                "bb/oversea/add_identity_internal"
            );
        };
        BBPayNewSuccessViewController =         {
            targets =             (
                "bb/trade/pintuan_pay_success"
            );
            title = "\U652f\U4ed8\U6210\U529f";
        };
        BBPayNewViewController =         {
            login = true;
            targets =             (
                "bb/trade/repay",
                "bb/trade/pay_right_now",
                "bb/trade/pay",
                "bb/trade/pay_fail"
            );
            title = "\U7ed3\U7b97";
        };
        BBPayResultWebViewController =         {
            targets =             (
                "bb/trade/pay_result_web"
            );
        };
        BBPaySuccessViewController =         {
            targets =             (
                "bb/trade/pay_success"
            );
            title = "\U652f\U4ed8\U6210\U529f";
        };
        BBProvinceViewController =         {
            targets =             (
                "bb/user/address_province"
            );
        };
        BBRefundShipmentBackViewController =         {
            targets =             (
                "bb/trade/refound_shipment_back"
            );
        };
        BBRefundTypeViewController =         {
            targets =             (
                "bb/trade/refound_resason"
            );
        };
        BBShipmentCompanyViewController =         {
            targets =             (
                "bb/trade/shipment_company"
            );
        };
        BBShoppingCartViewController =         {
            login = true;
            targets =             (
                "bb/trade/cart",
                cart,
                "bb/trade/maincart"
            );
        };
        BBSkuViewController =         {
            targets =             (
                "bb/base/sku"
            );
        };
        BBWeixinAgentPayViewController =         {
            targets =             (
                "bb/trade/weixin_agent_pay"
            );
            title = "\U53d1\U8d77\U4ee3\U4ed8\U8bf7\U6c42";
        };
        BDAccountSettingViewController =         {
            targets =             (
                "bd/account_security/setting"
            );
        };
        BDAdTimeSettingViewController =         {
            targets =             (
                "bd/preview_setting"
            );
        };
        BDBalancePayWithoutPasswordController =         {
            targets =             (
                "bd/user/balance_pay_without_password"
            );
        };
        BDBeibiViewController =         {
            targets =             (
                "bd/user/coupon"
            );
        };
        BDBindAlipaySuccessViewController =         {
            targets =             (
                "bd/alipay/bind_success"
            );
        };
        BDBindingAlipayViewController =         {
            login = true;
            targets =             (
                "bd/alipay/bind"
            );
        };
        BDBrandCouponViewController =         {
            targets =             (
                "bd/user/brand_coupon"
            );
        };
        BDBrandShareHistoryViewController =         {
            targets =             (
                "bd/brand/share_history"
            );
        };
        BDCategoryViewController =         {
            targets =             (
                "bd/search/main_category"
            );
        };
        BDCheckCardViewController =         {
            targets =             (
                "bbd/borrow/check_card"
            );
        };
        BDCouponShareHistoryController =         {
            targets =             (
                "bd/coupon/share_history"
            );
        };
        BDCouponViewController =         {
            targets =             (
                "bd/trade/coupon_use"
            );
        };
        BDDiscoveryChooseGoodsBuyHistoryViewController =         {
            targets =             (
                "bd/discovery/search_product_history"
            );
        };
        BDDiscoveryChooseTopicViewController =         {
            targets =             (
                "bd/discovery/publish_topic"
            );
        };
        BDDiscoveryCommentViewController =         {
            targets =             (
                "bd/discovery/comment"
            );
        };
        BDDiscoveryDetailViewController =         {
            targets =             (
                "bd/discovery/detail"
            );
        };
        BDDiscoveryHomeViewController =         {
            targets =             (
                "bd/discovery/home"
            );
        };
        BDDiscoveryMemberViewController =         {
            targets =             (
                "bd/discovery/member"
            );
        };
        BDDiscoveryOpenWeixinViewController =         {
            targets =             (
                "bd/discovery/share_open_wx"
            );
        };
        BDDiscoveryPublishViewController =         {
            targets =             (
                "bd/discovery/publish"
            );
        };
        BDDiscoveryTopicViewController =         {
            targets =             (
                "bd/discovery/topic"
            );
        };
        BDDiscoveryTrialApplyViewController =         {
            targets =             (
                "bd/discovery/apply_trial"
            );
        };
        BDFlagshipShopViewController =         {
            targets =             (
                "bd/mart/brand"
            );
        };
        BDGatherOrderViewController =         {
            login = true;
            targets =             (
                "bd/trade/gather_order"
            );
        };
        BDHomeMainViewController =         {
            targets =             (
                "bd/mart/home",
                home
            );
        };
        BDInputNewPayPasswordViewController =         {
            login = true;
            targets =             (
                "bd/shop/withdraw_input_newPayPassword"
            );
        };
        BDInterceptWebViewController =         {
            targets =             (
                "bbd/base/webview"
            );
        };
        BDInviteViewController =         {
            targets =             (
                "bd/user/invite"
            );
        };
        BDLoginViewController =         {
            targets =             (
                "bd/user/login",
                login
            );
        };
        BDMainScreenViewController =         {
            targets =             (
                "bd/base/main"
            );
        };
        BDMemberProfileViewController =         {
            targets =             (
                "bd/user/mine"
            );
        };
        BDMyBalanceViewController =         {
            login = true;
            targets =             (
                "bd/shop/fans_balance"
            );
        };
        BDMyCouponRecordViewController =         {
            targets =             (
                "bd/user/my_coupon_history"
            );
        };
        BDMyCouponsViewController =         {
            targets =             (
                "bd/user/my_coupon"
            );
        };
        BDMyMaterialViewController =         {
            targets =             (
                "bd/material/my_material"
            );
        };
        BDOrderCancelViewController =         {
            targets =             (
                "bd/trade/order_cancel"
            );
        };
        BDOrderListViewController =         {
            targets =             (
                "bd/sale/order_list",
                "bd/trade/order_list"
            );
        };
        BDOrderShareAlertViewController =         {
            targets =             (
                "bd/trade/comment_share"
            );
        };
        BDPersonalSaleAlertViewController =         {
            targets =             (
                "bd/base/PersonalSale"
            );
        };
        BDPhoneLoginViewController =         {
            targets =             (
                "bd/user/phone_login"
            );
        };
        BDPhotoAssetsViewController =         {
            targets =             (
                "bd/photo/assets"
            );
        };
        BDPlayVideoViewController =         {
            targets =             (
                "bb/base/video_player"
            );
        };
        BDProductDetailViewController =         {
            targets =             (
                "bd/product/detail",
                "bb/base/product"
            );
        };
        BDProductGatherViewController =         {
            login = true;
            targets =             (
                "bd/coupon/products"
            );
        };
        BDProductRatingsViewController =         {
            targets =             (
                "bd/product/rate"
            );
        };
        BDProductSharePopupViewController =         {
            targets =             (
                "bd/share/product_poster_alert"
            );
        };
        BDPublishViewController =         {
            targets =             (
                "bd/material/publish"
            );
        };
        BDRecommendInviterViewController =         {
            targets =             (
                "bd/user/invite_choose"
            );
        };
        BDRedPacketPayViewController =         {
            targets =             (
                "bd/trade/pay_coupon"
            );
            title = "\U652f\U4ed8";
        };
        BDScanViewController =         {
            targets =             (
                "bd/base/scan_code"
            );
        };
        BDSearchResultViewController =         {
            targets =             (
                "bd/search/result"
            );
        };
        BDSearchViewController =         {
            targets =             (
                "bd/search/home"
            );
        };
        BDSelfInfoViewController =         {
            targets =             (
                "bd/user/personal_info"
            );
        };
        BDSetPayPasswordViewController =         {
            login = true;
            targets =             (
                "bd/shop/withdraw_setPayPassword"
            );
        };
        BDSettingIntroductionViewController =         {
            targets =             (
                "bd/user/personal_info_introduction_edit"
            );
        };
        BDSettingNickController =         {
            targets =             (
                "bd/user/personal_info_text_edit"
            );
        };
        BDSettingViewController =         {
            targets =             (
                "bd/user/setting"
            );
        };
        BDShareTimelineAlertViewController =         {
            targets =             (
                "bd/share/timeline_alert"
            );
        };
        BDSimilarProductsViewController =         {
            login = true;
            targets =             (
                "bd/trade/similar_products"
            );
        };
        BDSplashAdsViewController =         {
            targets =             (
                "bd/home/splash_ads"
            );
        };
        BDStoreFeaturedViewController =         {
            login = true;
            targets =             (
                "bd/shop/feature"
            );
        };
        BDStoreHomeViewController =         {
            login = true;
            targets =             (
                "bd/shop/home"
            );
        };
        BDStoreInfoViewController =         {
            login = true;
            targets =             (
                "bd/shop/info"
            );
        };
        BDStoreManageViewController =         {
            login = true;
            targets =             (
                "bd/shop/manage"
            );
        };
        BDStoreNameViewController =         {
            login = true;
            targets =             (
                "bb/store_info_edit_name_intro",
                "bd/shop/intro"
            );
        };
        BDStoreRecruitViewController =         {
            login = true;
            targets =             (
                "bd/shop/recruit"
            );
        };
        BDStoreSharePopupViewController =         {
            targets =             (
                "bd/shop/share_alert"
            );
        };
        BDStoreTotalProfitViewController =         {
            targets =             (
                "bd/shop/total_profit"
            );
        };
        BDStoreVIPViewController =         {
            login = true;
            targets =             (
                "bd/shop/vip_list"
            );
        };
        BDStoreVisitorSharePopupViewController =         {
            targets =             (
                "bd/shop/visitor_share_alert"
            );
        };
        BDTabbarContainerViewController =         {
            targets =             (
                "bb/base/tab_container"
            );
        };
        BDTrialPublishViewController =         {
            targets =             (
                "bd/discovery/trial_publish"
            );
        };
        BDTrialSharePopupViewController =         {
            targets =             (
                "bd/discovery/trial_share_alert"
            );
        };
        BDUserFavorViewController =         {
            targets =             (
                "bd/base/user_favor"
            );
        };
        BDUserSessionManageViewController =         {
            targets =             (
                "bd/user/device_manager"
            );
        };
        BDWXRepayWebViewController =         {
            targets =             (
                "bb/beidai/wx_repay"
            );
        };
        BDWechartIDSetViewController =         {
            targets =             (
                "bd/user/wechat_id_text_edit"
            );
        };
        BDWithdrawAccountViewController =         {
            login = true;
            targets =             (
                "bd/shop/withdraw_account"
            );
        };
        BDWithdrawApplySuccessViewController =         {
            login = true;
            targets =             (
                "bd/shop/withdraw_applySuccess"
            );
        };
        BDWithdrawApplyViewController =         {
            login = true;
            targets =             (
                "bd/shop/withdraw_apply"
            );
        };
        BDWithdrawDetailViewController =         {
            login = true;
            targets =             (
                "bd/shop/withdraw_record_detail"
            );
        };
        BDWithdrawHomeViewController =         {
            login = true;
            targets =             (
                "bd/shop/withdraw_home"
            );
        };
        BDWithdrawRecordViewController =         {
            targets =             (
                "bd/withdraw/record"
            );
        };
        HBAutumnShowCardsViewController =         {
            targets =             (
                "bb/base/autumn_cards"
            );
        };
        HBCrashFuckerTestCaseViewController = "bb/base/crash_fucker_test";
        HBDebugConsoleViewController =         {
            targets =             (
                "bb/other/test"
            );
        };
        HBDowntimeViewController =         {
            targets =             (
                "bb/base/downtime"
            );
        };
        HBInteractivityConsoleViewController =         {
            targets =             (
                "bb/base/interactivity_console"
            );
        };
        HBNetworkDiagnosisViewController =         {
            targets =             (
                "bb/base/network_diagnosis",
                "hb/base/network_diagnosis"
            );
        };
        HBScanCodeViewController =         {
            targets =             (
                "bb/base/scan_code",
                "scan_code",
                "bb/search/scan_code"
            );
        };
        HBWebViewController =         {
            targets =             (
                "bb/base/webview",
                webview
            );
        };
        HBWeexViewController =         {
            targets =             (
                weex,
                "bb/base/weex"
            );
        };
    };
}
2018-12-11 16:54:59.390945+0800 beidian[21871:1546688] Weex -==- (null)
2018-12-11 16:54:59.391550+0800 beidian[21871:1546688] BDWeexExtensions -==- (null)
2018-12-11 16:54:59.393063+0800 beidian[21871:1546688] LoginInterceptor -==- {
    targets =     {
        BBActivityViewController =         {
            login = true;
            targets =             (
                "bb/c2c/activity"
            );
        };
        BBAddAddressViewController =         {
            targets =             (
                "bb/user/add_delivery_address"
            );
        };
        BBAddressesViewController =         {
            login = true;
            targets =             (
                "bb/user/delivery_address"
            );
        };
        BBAfterSalesCheckViewController =         {
            targets =             (
                "bb/trade/refund_check"
            );
        };
        BBAfterSalesViewController =         {
            login = true;
            targets =             (
                "refund_list",
                "bb/trade/refund_list"
            );
        };
        BBBankListViewController =         {
            targets =             (
                "bb/trade/bank_list"
            );
            title = "\U9009\U62e9\U94f6\U884c";
        };
        BBC2CMessageCenterViewController =         {
            login = true;
            targets =             (
                message,
                "bb/c2c/message",
                "bd/message/home"
            );
        };
        BBC2CMessagesCommentViewController =         {
            targets =             (
                "bb/c2c/messages_comment"
            );
        };
        BBC2CMessagesFollowViewController =         {
            targets =             (
                "bb/c2c/messages_follow"
            );
        };
        BBC2CMessagesLikeViewController =         {
            targets =             (
                "bb/c2c/messages_like"
            );
        };
        BBC2CMessagesViewController =         {
            targets =             (
                "bb/c2c/messages_super"
            );
        };
        BBCashCouponViewController =         {
            targets =             (
                "bb/trade/cash_coupon"
            );
            title = "\U73b0\U91d1\U5238";
        };
        BBChangeOrderAddressViewController =         {
            targets =             (
                "bb/trade/change_order_address",
                "bb/trade/change_address"
            );
        };
        BBCustomerViewController =         {
            targets =             (
                "bb/base/customer"
            );
        };
        BBIMChatViewController =         {
            login = true;
            targets =             (
                "bb/im/chat",
                "bb/im/newchat"
            );
        };
        BBImagePickerViewController =         {
            targets =             (
                "bb/base/image_picker"
            );
        };
        BBInvoiceFormViewController =         {
            targets =             (
                "bd/trade/invoice_info"
            );
            title = "\U53d1\U7968\U4fe1\U606f";
        };
        BBMessageCenterViewController =         {
            login = true;
            targets =             (
                "bb/c2c/message_center"
            );
        };
        BBMessageDetailViewController =         {
            login = true;
            targets =             (
                "bb/c2c/message_detail"
            );
        };
        BBNewAftersaleDetailViewController =         {
            targets =             (
                "refund_detail",
                "bb/trade/refund_detail"
            );
        };
        BBNewApplyAfterSaleViewController =         {
            login = true;
            targets =             (
                "bb/trade/apply_refund"
            );
        };
        BBNewTrackViewController =         {
            targets =             (
                "bb/trade/shippment_check"
            );
        };
        BBOrderDetailViewController =         {
            login = true;
            targets =             (
                "order_detail",
                "bb/trade/order_detail"
            );
            title = "\U8ba2\U5355\U8be6\U60c5";
        };
        BBOrderListSearchResultViewController =         {
            targets =             (
                "bb/trade/order_search_result"
            );
        };
        BBOrderListSearchViewController =         {
            targets =             (
                "bb/trade/order_search"
            );
        };
        BBOrderListViewController =         {
            login = true;
            targets =             (
                "bb/trade/order_list",
                "order_list"
            );
            title = "\U6211\U7684\U8ba2\U5355";
        };
        BBOrderRefundReasonViewController =         {
            targets =             (
                "bb/trade/refound_type"
            );
        };
        BBOverseaCredentialListController =         {
            login = true;
            targets =             (
                "bb/oversea/credential_list",
                "bb/user/credential_list"
            );
        };
        BBOverseaCredentialViewController =         {
            login = true;
            targets =             (
                "bb/oversea/credential"
            );
        };
        BBOverseaIdentityViewController =         {
            login = true;
            targets =             (
                "bb/user/edit_credential",
                "bb/oversea/add_identity_internal"
            );
        };
        BBPayNewSuccessViewController =         {
            targets =             (
                "bb/trade/pintuan_pay_success"
            );
            title = "\U652f\U4ed8\U6210\U529f";
        };
        BBPayNewViewController =         {
            login = true;
            targets =             (
                "bb/trade/repay",
                "bb/trade/pay_right_now",
                "bb/trade/pay",
                "bb/trade/pay_fail"
            );
            title = "\U7ed3\U7b97";
        };
        BBPayResultWebViewController =         {
            targets =             (
                "bb/trade/pay_result_web"
            );
        };
        BBPaySuccessViewController =         {
            targets =             (
                "bb/trade/pay_success"
            );
            title = "\U652f\U4ed8\U6210\U529f";
        };
        BBProvinceViewController =         {
            targets =             (
                "bb/user/address_province"
            );
        };
        BBRefundShipmentBackViewController =         {
            targets =             (
                "bb/trade/refound_shipment_back"
            );
        };
        BBRefundTypeViewController =         {
            targets =             (
                "bb/trade/refound_resason"
            );
        };
        BBShipmentCompanyViewController =         {
            targets =             (
                "bb/trade/shipment_company"
            );
        };
        BBShoppingCartViewController =         {
            login = true;
            targets =             (
                "bb/trade/cart",
                cart,
                "bb/trade/maincart"
            );
        };
        BBSkuViewController =         {
            targets =             (
                "bb/base/sku"
            );
        };
        BBWeixinAgentPayViewController =         {
            targets =             (
                "bb/trade/weixin_agent_pay"
            );
            title = "\U53d1\U8d77\U4ee3\U4ed8\U8bf7\U6c42";
        };
        BDAccountSettingViewController =         {
            targets =             (
                "bd/account_security/setting"
            );
        };
        BDAdTimeSettingViewController =         {
            targets =             (
                "bd/preview_setting"
            );
        };
        BDBalancePayWithoutPasswordController =         {
            targets =             (
                "bd/user/balance_pay_without_password"
            );
        };
        BDBeibiViewController =         {
            targets =             (
                "bd/user/coupon"
            );
        };
        BDBindAlipaySuccessViewController =         {
            targets =             (
                "bd/alipay/bind_success"
            );
        };
        BDBindingAlipayViewController =         {
            login = true;
            targets =             (
                "bd/alipay/bind"
            );
        };
        BDBrandCouponViewController =         {
            targets =             (
                "bd/user/brand_coupon"
            );
        };
        BDBrandShareHistoryViewController =         {
            targets =             (
                "bd/brand/share_history"
            );
        };
        BDCategoryViewController =         {
            targets =             (
                "bd/search/main_category"
            );
        };
        BDCheckCardViewController =         {
            targets =             (
                "bbd/borrow/check_card"
            );
        };
        BDCouponShareHistoryController =         {
            targets =             (
                "bd/coupon/share_history"
            );
        };
        BDCouponViewController =         {
            targets =             (
                "bd/trade/coupon_use"
            );
        };
        BDDiscoveryChooseGoodsBuyHistoryViewController =         {
            targets =             (
                "bd/discovery/search_product_history"
            );
        };
        BDDiscoveryChooseTopicViewController =         {
            targets =             (
                "bd/discovery/publish_topic"
            );
        };
        BDDiscoveryCommentViewController =         {
            targets =             (
                "bd/discovery/comment"
            );
        };
        BDDiscoveryDetailViewController =         {
            targets =             (
                "bd/discovery/detail"
            );
        };
        BDDiscoveryHomeViewController =         {
            targets =             (
                "bd/discovery/home"
            );
        };
        BDDiscoveryMemberViewController =         {
            targets =             (
                "bd/discovery/member"
            );
        };
        BDDiscoveryOpenWeixinViewController =         {
            targets =             (
                "bd/discovery/share_open_wx"
            );
        };
        BDDiscoveryPublishViewController =         {
            targets =             (
                "bd/discovery/publish"
            );
        };
        BDDiscoveryTopicViewController =         {
            targets =             (
                "bd/discovery/topic"
            );
        };
        BDDiscoveryTrialApplyViewController =         {
            targets =             (
                "bd/discovery/apply_trial"
            );
        };
        BDFlagshipShopViewController =         {
            targets =             (
                "bd/mart/brand"
            );
        };
        BDGatherOrderViewController =         {
            login = true;
            targets =             (
                "bd/trade/gather_order"
            );
        };
        BDHomeMainViewController =         {
            targets =             (
                "bd/mart/home",
                home
            );
        };
        BDInputNewPayPasswordViewController =         {
            login = true;
            targets =             (
                "bd/shop/withdraw_input_newPayPassword"
            );
        };
        BDInterceptWebViewController =         {
            targets =             (
                "bbd/base/webview"
            );
        };
        BDInviteViewController =         {
            targets =             (
                "bd/user/invite"
            );
        };
        BDLoginViewController =         {
            targets =             (
                "bd/user/login",
                login
            );
        };
        BDMainScreenViewController =         {
            targets =             (
                "bd/base/main"
            );
        };
        BDMemberProfileViewController =         {
            targets =             (
                "bd/user/mine"
            );
        };
        BDMyBalanceViewController =         {
            login = true;
            targets =             (
                "bd/shop/fans_balance"
            );
        };
        BDMyCouponRecordViewController =         {
            targets =             (
                "bd/user/my_coupon_history"
            );
        };
        BDMyCouponsViewController =         {
            targets =             (
                "bd/user/my_coupon"
            );
        };
        BDMyMaterialViewController =         {
            targets =             (
                "bd/material/my_material"
            );
        };
        BDOrderCancelViewController =         {
            targets =             (
                "bd/trade/order_cancel"
            );
        };
        BDOrderListViewController =         {
            targets =             (
                "bd/sale/order_list",
                "bd/trade/order_list"
            );
        };
        BDOrderShareAlertViewController =         {
            targets =             (
                "bd/trade/comment_share"
            );
        };
        BDPersonalSaleAlertViewController =         {
            targets =             (
                "bd/base/PersonalSale"
            );
        };
        BDPhoneLoginViewController =         {
            targets =             (
                "bd/user/phone_login"
            );
        };
        BDPhotoAssetsViewController =         {
            targets =             (
                "bd/photo/assets"
            );
        };
        BDPlayVideoViewController =         {
            targets =             (
                "bb/base/video_player"
            );
        };
        BDProductDetailViewController =         {
            targets =             (
                "bd/product/detail",
                "bb/base/product"
            );
        };
        BDProductGatherViewController =         {
            login = true;
            targets =             (
                "bd/coupon/products"
            );
        };
        BDProductRatingsViewController =         {
            targets =             (
                "bd/product/rate"
            );
        };
        BDProductSharePopupViewController =         {
            targets =             (
                "bd/share/product_poster_alert"
            );
        };
        BDPublishViewController =         {
            targets =             (
                "bd/material/publish"
            );
        };
        BDRecommendInviterViewController =         {
            targets =             (
                "bd/user/invite_choose"
            );
        };
        BDRedPacketPayViewController =         {
            targets =             (
                "bd/trade/pay_coupon"
            );
            title = "\U652f\U4ed8";
        };
        BDScanViewController =         {
            targets =             (
                "bd/base/scan_code"
            );
        };
        BDSearchResultViewController =         {
            targets =             (
                "bd/search/result"
            );
        };
        BDSearchViewController =         {
            targets =             (
                "bd/search/home"
            );
        };
        BDSelfInfoViewController =         {
            targets =             (
                "bd/user/personal_info"
            );
        };
        BDSetPayPasswordViewController =         {
            login = true;
            targets =             (
                "bd/shop/withdraw_setPayPassword"
            );
        };
        BDSettingIntroductionViewController =         {
            targets =             (
                "bd/user/personal_info_introduction_edit"
            );
        };
        BDSettingNickController =         {
            targets =             (
                "bd/user/personal_info_text_edit"
            );
        };
        BDSettingViewController =         {
            targets =             (
                "bd/user/setting"
            );
        };
        BDShareTimelineAlertViewController =         {
            targets =             (
                "bd/share/timeline_alert"
            );
        };
        BDSimilarProductsViewController =         {
            login = true;
            targets =             (
                "bd/trade/similar_products"
            );
        };
        BDSplashAdsViewController =         {
            targets =             (
                "bd/home/splash_ads"
            );
        };
        BDStoreFeaturedViewController =         {
            login = true;
            targets =             (
                "bd/shop/feature"
            );
        };
        BDStoreHomeViewController =         {
            login = true;
            targets =             (
                "bd/shop/home"
            );
        };
        BDStoreInfoViewController =         {
            login = true;
            targets =             (
                "bd/shop/info"
            );
        };
        BDStoreManageViewController =         {
            login = true;
            targets =             (
                "bd/shop/manage"
            );
        };
        BDStoreNameViewController =         {
            login = true;
            targets =             (
                "bb/store_info_edit_name_intro",
                "bd/shop/intro"
            );
        };
        BDStoreRecruitViewController =         {
            login = true;
            targets =             (
                "bd/shop/recruit"
            );
        };
        BDStoreSharePopupViewController =         {
            targets =             (
                "bd/shop/share_alert"
            );
        };
        BDStoreTotalProfitViewController =         {
            targets =             (
                "bd/shop/total_profit"
            );
        };
        BDStoreVIPViewController =         {
            login = true;
            targets =             (
                "bd/shop/vip_list"
            );
        };
        BDStoreVisitorSharePopupViewController =         {
            targets =             (
                "bd/shop/visitor_share_alert"
            );
        };
        BDTabbarContainerViewController =         {
            targets =             (
                "bb/base/tab_container"
            );
        };
        BDTrialPublishViewController =         {
            targets =             (
                "bd/discovery/trial_publish"
            );
        };
        BDTrialSharePopupViewController =         {
            targets =             (
                "bd/discovery/trial_share_alert"
            );
        };
        BDUserFavorViewController =         {
            targets =             (
                "bd/base/user_favor"
            );
        };
        BDUserSessionManageViewController =         {
            targets =             (
                "bd/user/device_manager"
            );
        };
        BDWXRepayWebViewController =         {
            targets =             (
                "bb/beidai/wx_repay"
            );
        };
        BDWechartIDSetViewController =         {
            targets =             (
                "bd/user/wechat_id_text_edit"
            );
        };
        BDWithdrawAccountViewController =         {
            login = true;
            targets =             (
                "bd/shop/withdraw_account"
            );
        };
        BDWithdrawApplySuccessViewController =         {
            login = true;
            targets =             (
                "bd/shop/withdraw_applySuccess"
            );
        };
        BDWithdrawApplyViewController =         {
            login = true;
            targets =             (
                "bd/shop/withdraw_apply"
            );
        };
        BDWithdrawDetailViewController =         {
            login = true;
            targets =             (
                "bd/shop/withdraw_record_detail"
            );
        };
        BDWithdrawHomeViewController =         {
            login = true;
            targets =             (
                "bd/shop/withdraw_home"
            );
        };
        BDWithdrawRecordViewController =         {
            targets =             (
                "bd/withdraw/record"
            );
        };
        HBAutumnShowCardsViewController =         {
            targets =             (
                "bb/base/autumn_cards"
            );
        };
        HBCrashFuckerTestCaseViewController = "bb/base/crash_fucker_test";
        HBDebugConsoleViewController =         {
            targets =             (
                "bb/other/test"
            );
        };
        HBDowntimeViewController =         {
            targets =             (
                "bb/base/downtime"
            );
        };
        HBInteractivityConsoleViewController =         {
            targets =             (
                "bb/base/interactivity_console"
            );
        };
        HBNetworkDiagnosisViewController =         {
            targets =             (
                "bb/base/network_diagnosis",
                "hb/base/network_diagnosis"
            );
        };
        HBScanCodeViewController =         {
            targets =             (
                "bb/base/scan_code",
                "scan_code",
                "bb/search/scan_code"
            );
        };
        HBWebViewController =         {
            targets =             (
                "bb/base/webview",
                webview
            );
        };
        HBWeexViewController =         {
            targets =             (
                weex,
                "bb/base/weex"
            );
        };
    };
}
2018-12-11 16:54:59.400425+0800 beidian[21871:1546688] ConfigCenter -==- {
    "api_method" = "beidian.app.config.get";
    "api_query_module" = "beidian_system_config";
}
2018-12-11 16:54:59.402608+0800 beidian[21871:1546688] Click -==- {
    app = beidian;
    "default_endpoint" = "http://c.beibei.com/m8.gif";
    "migration_endpoint" = "http://c.beibei.com/m8_p.gif";
    "migration_events" =     (
                {
            ename = "\U9876\U90e8\U5546\U54c1\U5206\U4eab";
            id = 421;
            nezha = "\U9876\U90e8\U5546\U54c1\U5206\U4eab";
        },
                {
            ename = "\U5546\U54c1\U4e3b\U56fe_\U4e8c\U7ef4\U7801\U56fe";
            id = 447;
            nezha = "\U5546\U54c1\U4e3b\U56fe_\U4e8c\U7ef4\U7801\U56fe";
        },
                {
            ename = "\U5546\U54c1\U4e3b\U56fe_\U4fdd\U5b58\U56fe\U7247";
            id = 446;
            nezha = "\U5546\U54c1\U4e3b\U56fe_\U4fdd\U5b58\U56fe\U7247";
        },
                {
            ename = "\U4e70";
            id = 448;
            nezha = "\U4e70";
        },
                {
            ename = "\U5356";
            id = 449;
            nezha = "\U5356";
        },
                {
            ename = "\U52a0\U5165\U8d2d\U7269\U8f66";
            id = 450;
            nezha = "\U52a0\U5165\U8d2d\U7269\U8f66";
        },
                {
            ename = "\U5ba2\U670d";
            id = 453;
            nezha = "\U5ba2\U670d";
        },
                {
            ename = "\U4e0a\U67b6";
            id = 452;
            nezha = "\U4e0a\U67b6";
        },
                {
            ename = "\U4e0b\U67b6";
            id = 453;
            nezha = "\U4e0b\U67b6";
        },
                {
            ename = "\U9009\U62e9\U89c4\U683c";
            id = 465;
            model = optional;
            nezha = "\U9009\U62e9\U89c4\U683c";
        },
                {
            ename = "\U9009\U62e9\U89c4\U683c_\U7acb\U5373\U8d2d\U4e70";
            id = 457;
            nezha = "\U9009\U62e9\U89c4\U683c_\U7acb\U5373\U8d2d\U4e70";
        },
                {
            ename = "\U9009\U62e9\U89c4\U683c_\U52a0\U5165\U8d2d\U7269\U8f66";
            id = 456;
            nezha = "\U9009\U62e9\U89c4\U683c_\U52a0\U5165\U8d2d\U7269\U8f66";
        },
                {
            ename = "APP\U5546\U8be6_\U67e5\U770b\U5168\U90e8\U8bc4\U4ef7";
            id = 424;
            nezha = "\U67e5\U770b\U5168\U90e8\U8bc4\U4ef7";
        },
                {
            ename = "\U7acb\U5373\U8d2d\U4e70";
            id = 472;
            nezha = "\U7acb\U5373\U8d2d\U4e70";
        },
                {
            ename = "APP\U5546\U8be6_\U4e70\U5bb6\U53e3\U7891";
            id = 458;
            nezha = "\U4e70\U5bb6\U53e3\U7891";
        },
                {
            ename = "APP\U5546\U8be6_\U7f6e\U9876\U8bc4\U4ef7";
            id = 423;
            nezha = "\U7f6e\U9876\U8bc4\U4ef7";
        },
                {
            ename = "\U9886\U5238";
            id = 459;
            nezha = "\U9886\U5238";
        },
                {
            ename = "\U670d\U52a1";
            id = 461;
            nezha = "\U670d\U52a1";
        },
                {
            ename = "\U5546\U8be6\U9875-\U7c89\U4e1d\U798f\U5229\U5238\U5165\U53e3-\U70b9\U51fb";
            id = 460;
            nezha = "\U7c89\U4e1d\U798f\U5229\U5238\U5165\U53e3";
        },
                {
            ename = "\U5546\U8be6\U9886\U5238_\U7acb\U5373\U9886\U53d6";
            id = 462;
            nezha = "\U7acb\U5373\U9886\U53d6";
        },
                {
            ename = "\U8fdb\U5165\U54c1\U724c";
            id = 463;
            nezha = "\U8fdb\U5165\U54c1\U724c";
        },
                {
            ename = "\U8d2d\U7269\U8f66";
            id = 473;
            nezha = "\U8d2d\U7269\U8f66";
        },
                {
            ename = "\U4e70\U5bb6\U8bc4\U4ef7_\U6807\U7b7e\U70b9\U51fb";
            id = 422;
            nezha = "\U8bc4\U4ef7\U6807\U7b7e";
        },
                {
            ename = "\U731c\U4f60\U559c\U6b22";
            id = 464;
            nezha = "\U63a8\U8350\U5546\U54c1";
        },
                {
            ename = "APP\U5546\U8be6__\U70b9\U51fb\U6536\U85cf";
            id = 467;
            model = optional;
            nezha = "\U6536\U85cf";
        },
                {
            block = "\U5546\U54c1";
            ename = "\U4fc3\U9500\U6a21\U5757\U70b9\U51fb";
            id = 471;
            model = optional;
            nezha = "\U4fc3\U9500";
        },
                {
            ename = "APP\U5546\U8be6>sku\U5f39\U7a97>\U70b9\U51fb\U5c3a\U7801\U8868";
            id = 466;
            model = optional;
            nezha = "\U67e5\U770b\U5c3a\U7801\U8868";
        },
                {
            ename = "APP\U5546\U8be6\U9875>\U5956\U52b1\U6d3b\U52a8\U70b9\U51fb";
            id = 470;
            nezha = "\U5956\U52b1\U6d3b\U52a8";
        },
                {
            ename = "APP\U5546\U8be6__\U70b9\U51fb\U53d6\U6d88\U6536\U85cf";
            id = 468;
            model = optional;
            nezha = "\U53d6\U6d88\U6536\U85cf";
        },
                {
            ename = "\U5546\U8be6_\U670d\U52a1\U6d6e\U5c42_\U8d35\U5c31\U8d54\U67e5\U770b\U8be6\U60c5\U70b9\U51fb";
            id = 469;
            model = optional;
            nezha = "\U8d35\U5c31\U8d54\U67e5\U770b\U8be6\U60c5";
        },
                {
            ename = "\U5fc3\U5f97\U53d1\U5e03\U4eba_\U70b9\U51fb";
            id = 487;
            nezha = "\U53d1\U5e03\U4eba";
        },
                {
            ename = "\U70b9\U8d5e_\U70b9\U51fb";
            id = 474;
            model = optional;
            nezha = "\U70b9\U8d5e";
        },
                {
            ename = "\U5206\U4eab_\U70b9\U51fb";
            id = 475;
            model = optional;
            nezha = "\U5206\U4eab";
        },
                {
            ename = "\U4fdd\U5b58_\U70b9\U51fb";
            id = 476;
            model = optional;
            nezha = "\U4fdd\U5b58";
        },
                {
            ename = "\U5185\U5bb9_\U70b9\U51fb";
            id = 489;
            nezha = "\U5185\U5bb9";
        },
                {
            ename = "\U8bc4\U4ef7\U56fe\U7247_\U70b9\U51fb";
            id = 477;
            nezha = "\U56fe\U7247";
        },
                {
            ename = "\U5173\U6ce8\U5fc3\U5f97_\U70b9\U51fb";
            id = 488;
            nezha = "\U5173\U6ce8";
        },
                {
            ename = "APP\U5546\U8be6_\U8bc4\U4ef7_\U70b9\U51fb\U5c55\U5f00";
            id = 491;
            nezha = "\U5c55\U5f00\U6587\U5b57";
        },
                {
            block = "\Uff1f\Uff1f\Uff1f";
            ename = "\U53d1\U5e03\U7d20\U6750";
            nezha = "\U53d1\U5e03\U7d20\U6750";
        },
                {
            ename = "APP\U5546\U8be6_\U8bc4\U4ef7\U7b5b\U9009";
            id = 479;
            nezha = "\U6807\U7b7e";
        },
                {
            ename = "\U5fc3\U5f97\U53d1\U5e03\U4eba_\U70b9\U51fb";
            id = 484;
            nezha = "\U53d1\U5e03\U4eba";
        },
                {
            ename = "\U70b9\U8d5e_\U70b9\U51fb";
            id = 481;
            model = optional;
            nezha = "\U70b9\U8d5e";
        },
                {
            ename = "\U5206\U4eab_\U70b9\U51fb";
            id = 482;
            model = optional;
            nezha = "\U5206\U4eab";
        },
                {
            ename = "\U4fdd\U5b58_\U70b9\U51fb";
            id = 483;
            model = optional;
            nezha = "\U4fdd\U5b58";
        },
                {
            ename = "\U5185\U5bb9_\U70b9\U51fb";
            id = 480;
            nezha = "\U5185\U5bb9";
        },
                {
            ename = "\U8bc4\U4ef7\U56fe\U7247_\U70b9\U51fb";
            id = 486;
            nezha = "\U56fe\U7247";
        },
                {
            ename = "\U5173\U6ce8\U5fc3\U5f97_\U70b9\U51fb";
            id = 485;
            nezha = "\U5173\U6ce8";
        },
                {
            ename = "APP\U5546\U8be6_\U8bc4\U4ef7_\U70b9\U51fb\U5c55\U5f00";
            id = 478;
            nezha = "\U5c55\U5f00\U6587\U5b57";
        },
                {
            ename = "\U590d\U5236\U94fe\U63a5";
            id = 432;
            nezha = "\U590d\U5236\U94fe\U63a5";
        },
                {
            ename = "\U6d88\U606f\U4e2d\U5fc3";
            id = 281;
            nezha = "\U6d88\U606f\U4e2d\U5fc3";
        },
                {
            ename = "\U641c\U7d22";
            id = 282;
            nezha = "\U641c\U7d22";
        },
                {
            ename = "\U65f6\U95f4\U8f74tab";
            id = 283;
            nezha = "\U65f6\U95f4\U8f74tab";
        },
                {
            ename = "\U8d5b\U9a6c\U5546\U54c1\U5217\U8868";
            id = 290;
            nezha = "\U8d5b\U9a6c\U5546\U54c1\U5217\U8868";
        },
                {
            ename = "\U8d5b\U9a6c\U5546\U54c1\U5217\U8868";
            id = 313;
            nezha = "\U8d5b\U9a6c\U5546\U54c1\U5217\U8868";
        },
                {
            ename = "\U8d5b\U9a6c\U5546\U54c1\U5217\U8868";
            id = 394;
            nezha = "\U8d5b\U9a6c\U5546\U54c1\U5217\U8868";
        },
                {
            ename = "\U8d5b\U9a6c\U5546\U54c1\U5217\U8868";
            id = 401;
            nezha = "\U8d5b\U9a6c\U5546\U54c1\U5217\U8868";
        },
                {
            ename = "\U4e0a\U67b6";
            id = 292;
            nezha = "\U4e0a\U67b6";
        },
                {
            ename = "\U4e0b\U67b6";
            id = 387;
            nezha = "\U4e0b\U67b6";
        },
                {
            ename = "\U4e0b\U67b6";
            nezha = "\U4e0b\U67b6";
        },
                {
            ename = "\U5355\U54c1\U5217\U8868";
            id = 392;
            nezha = "\U5355\U54c1\U5217\U8868";
        },
                {
            ename = "\U5355\U54c1\U5217\U8868";
            id = 393;
            nezha = "\U5355\U54c1\U5217\U8868";
        }
    );
    "migration_strategies" =     {
        281 = 1;
        282 = 1;
        283 = 1;
        284 = 1;
        285 = 1;
        286 = 1;
        287 = 1;
        288 = 1;
        290 = 1;
        292 = 1;
        293 = 1;
        294 = 1;
        295 = 1;
        297 = 1;
        305 = 1;
        313 = 1;
        387 = 1;
        388 = 1;
        389 = 1;
        390 = 1;
        392 = 1;
        393 = 1;
        394 = 1;
        397 = 1;
        401 = 1;
    };
    "split_rules" =     {
        "http://c.beibei.com/m8_p.gif" =         (
            "network_diagnosis",
            "perf_apd_conf",
            "network-engine-error",
            kBBHusorClickContrast,
            "testflight-check",
            "hb_log",
            "httpdns_forced_on",
            "dnspod_request",
            "perf_apd_performance",
            SSLHealthReport,
            "h5_performance",
            hybridInCache,
            log,
            "perf_weex_performance",
            kRecordAppHotStartTime,
            kHBMonitorThreadBlock,
            kRecordAppColdStartTime,
            kRecordAppMemoryWarning,
            "network_status",
            "session_invalid_3",
            performance2,
            "perf_weex_error",
            "REGEX:^pref_"
        );
    };
}
2018-12-11 16:54:59.408338+0800 beidian[21871:1546688] MobClick -==- {
    "app_version" = "3.20.00";
    "channel_id" = "App Store";
}
2018-12-11 16:54:59.408629+0800 beidian[21871:1546688] HusorClick -==- {
    "channel_id" = "App Store";
    "device_id" = 79567444dca4b46bf4e09e3d8efbc360682b72f5;
    session = beidian;
    "upload_uri" = "/m8.gif";
    "uploader_host" = "http://c.beibei.com";
    "user_id" = 61076596;
    version = "3.20.00";
}
2018-12-11 16:54:59.409293+0800 beidian[21871:1546688] AdReporter -==- {
    "upload_uri" = "/rt1.gif";
    "uploader_host" = "http://c.beibei.com";
}
2018-12-11 16:54:59.409491+0800 beidian[21871:1546688] UserAgent -==- {
    "app_name" = Beidian;
    "app_version" = "3.20.00";
}
2018-12-11 16:54:59.409729+0800 beidian[21871:1546688] WebView -==- {
    "auth_hosts" =     (
        "m.beidian.com"
    );
}
2018-12-11 16:54:59.409860+0800 beidian[21871:1546688] BDShareLib -==- (null)
2018-12-11 16:54:59.410445+0800 beidian[21871:1546688] Share -==- {
    "qq_app_id" = 101070697;
    "weibo_app_key" = 2936998125;
    "weibo_app_secret" = 67cc6cd3f75952b749ecdcd8aa239e2a;
    "weibo_redirect_uri" = "http://www.beibei.com";
    "weixin_app_id" = wx6cb97796e0a26752;
}
2018-12-11 16:54:59.410867+0800 beidian[21871:1546688] PerformanceMonitor -==- {
    enabled = 1;
    "ignored_vc" =     (
        BBMainViewController,
        BBOverseaViewController,
        BBPinTuanHomeViewController,
        BBShoppingCartViewController,
        BBMineViewController
    );
    "log_event" = 0;
    "show_fps" = 0;
    "show_memory" = 1;
}
2018-12-11 16:54:59.411346+0800 beidian[21871:1546688] UpdateEngine -==- {
    modules =     {
        configcenter =         {
            class = HBConfigCenterUpdater;
            interval = 600;
            repeat = true;
        };
        hotfix = HBHotFixUpdater;
        hybrid =         {
            class = HBHybridUpdater;
            interval = 600;
            repeat = true;
        };
    };
}
2018-12-11 16:54:59.412066+0800 beidian[21871:1546688] TasteIt -==- {
    "service_url" = "http://pkg.hucdn.com/beidian/latest_version.json";
    "valid_bundle_identifier" = "com.husor.beidian.enterprise";
}
2018-12-11 16:54:59.412688+0800 beidian[21871:1546688] URLHandler -==- {
    handlers =     (
                {
            HBURLHandlerQZone = tencent101070697;
        },
                {
            HBURLHandlerApp = qn4132afce783e;
        },
                {
            HBURLHandlerWeexDevTool = http;
        },
                {
            BDURLHandlerActivityPay = AlipayBeidianApp;
        },
                {
            HBURLHandlerAlipay = AlipayBeidianAuthApp;
        },
                {
            HBURLHandlerNezha = nezha;
        },
                {
            HBURLHandlerAutumn = autumn;
        }
    );
}
2018-12-11 16:54:59.413252+0800 beidian[21871:1546688] URLHandlerBeidian -==- (null)
2018-12-11 16:54:59.413751+0800 beidian[21871:1546688] FeedbackLog -==- (null)
2018-12-11 16:54:59.413883+0800 beidian[21871:1546688] WebProxyServer -==- (null)
2018-12-11 16:54:59.414018+0800 beidian[21871:1546688] LocalNotification -==- (null)
2018-12-11 16:54:59.414138+0800 beidian[21871:1546688] NotificationHandler -==- (null)
2018-12-11 16:54:59.414310+0800 beidian[21871:1546688] Misc -==- (null)
2018-12-11 16:54:59.427026+0800 beidian[21871:1546688] Pay -==- {
    "alipay_scheme" = AlipayBeidianApp;
    "pay_bar_configs" =     {
        "pay_btn_background_color" = 0xE31436;
        "pay_left_text_color" = 0xE31436;
    };
    "pay_result_order_target" = "beidian://bd/sale/orders?status=wait_for_pay";
    "pay_success_cell_left_url" = "beidian://bd/sale/orders?status=all";
    "pay_success_cell_right_url" = "beidian://bd/mart/home";
    "pay_success_pop_url" = "beidian://bd/user/mine";
    "pay_success_recomm" = 0;
    "repay_tips" = "\U672a\U5b8c\U6210\U652f\U4ed8\U7684\U8ba2\U5355\U4f1a\U4e3a\U60a8\U4fdd\U755930\U5206\U949f\Uff0c\U53ef\U5728\U6211\U7684\U8d1d\U5e97\U5f85\U4ed8\U6b3e\U8ba2\U5355\U4e2d\U518d\U6b21\U652f\U4ed8";
}
2018-12-11 16:54:59.453472+0800 beidian[21871:1546688] Cart -==- {
    "pay_bar_configs" =     {
        "pay_btn_background_color" = 0xE31436;
        "pay_left_text_color" = 0xE31436;
    };
}
2018-12-11 16:54:59.454068+0800 beidian[21871:1546688] Order -==- {
    "order_detail_recomm" = 1;
    "order_detail_request_method" = "beidian.trade.order.get";
}
2018-12-11 16:54:59.454929+0800 beidian[21871:1546688] Sku -==- {
    "corner_radius" = 3;
    "item_stock_method" = "beidian.item.stock.get";
    "pre_theme_color" = 0x1EAE44;
    "theme_color" = 0xE31436;
}
2018-12-11 16:54:59.455215+0800 beidian[21871:1546688] RecomListHelper -==- {
    "fav_icon" = "ic_shop_like";
    "price_color" = 14881846;
    "recom_list_request_method" = "beidian.recom.list.get";
    "title_color" = 0;
}
2018-12-11 16:54:59.455523+0800 beidian[21871:1546688] InfinitelyFooter -==- {
    startOffset = 1000;
}
2018-12-11 16:54:59.456519+0800 beidian[21871:1546688] RefreshHeader -==- {
    "activity_view_line_color" = "#FFE31416";
    "arrow_image" = "ic_refresh_down";
    "gif_image" = "img_xiaobei";
    "title_image" = "img_sanpei_refresh_down";
}
2018-12-11 16:54:59.566471+0800 beidian[21871:1546688] DynamicRefreshHeader -==- {
    "title_image_config_key" = "scene_refresh_default";
}
2018-12-11 16:54:59.585827+0800 beidian[21871:1546688] Downtime -==- {
    endpoint = "http://status.hucdn.com/beidian/status.json";
}
2018-12-11 16:54:59.586594+0800 beidian[21871:1546688] EmptyView -==- {
    404 =     {
        bundle = BBUIKit;
        svg = "img_404";
    };
    "beidian_normal" =     {
        bundle = BBUIKit;
        svg = "img_beidian_normal";
    };
    common =     {
        bundle = BBUIKit;
        svg = "img_common";
    };
    favorite =     {
        bundle = BBUIKit;
        svg = "img_favorite";
    };
    footprint =     {
        bundle = BBUIKit;
        svg = "img_footprint";
    };
    information =     {
        bundle = BBUIKit;
        svg = "img_information";
    };
    message =     {
        bundle = BBUIKit;
        svg = "img_message";
    };
    money =     {
        bundle = BBUIKit;
        svg = "img_money";
    };
    order =     {
        bundle = BBUIKit;
        svg = "img_order";
    };
    question =     {
        bundle = BBUIKit;
        svg = "img_question";
    };
    search =     {
        bundle = BBUIKit;
        svg = "img_search";
    };
    shopping =     {
        bundle = BBUIKit;
        svg = "img_shopping";
    };
}
2018-12-11 16:54:59.587062+0800 beidian[21871:1546688] MTA -==- {
    "app_key" = I54FY8H8ASVQ;
}
2018-12-11 16:54:59.587285+0800 beidian[21871:1546688] FacePP -==- (null)
2018-12-11 16:54:59.587853+0800 beidian[21871:1546688] Badge -==- (null)
2018-12-11 16:54:59.588024+0800 beidian[21871:1546688] CodeVerify -==- (null)
2018-12-11 16:54:59.588504+0800 beidian[21871:1546688] Reachability -==- (null)
2018-12-11 16:54:59.594131+0800 beidian[21871:1546688] Networking -==- (null)
2018-12-11 16:54:59.594851+0800 beidian[21871:1546688] WebP -==- (null)
2018-12-11 16:54:59.595315+0800 beidian[21871:1546688] Beidian -==- (null)
2018-12-11 16:54:59.595861+0800 beidian[21871:1546688] Home -==- (null)
2018-12-11 16:54:59.596448+0800 beidian[21871:1546688] Discovery -==- {
}
2018-12-11 16:54:59.615626+0800 beidian[21871:1546688] Oversea -==- (null)
2018-12-11 16:54:59.615799+0800 beidian[21871:1546688] Member -==- (null)
2018-12-11 16:54:59.617011+0800 beidian[21871:1546688] Commonlib -==- {
    ads =     {
        ads = 1;
        "beidian_103s" = 103;
        "beidian_104s" = 104;
        "beidian_106s" = 106;
        "beidian_108s" = 108;
        "beidian_109s" = 109;
        "beidian_10s" = 10;
        "beidian_110s" = 110;
        "beidian_16s" = 16;
        "beidian_17s" = 17;
        "beidian_19s" = 19;
        "beidian_21s" = 21;
        "beidian_28s" = 28;
        "beidian_29s" = 29;
        "beidian_32s" = 32;
        "beidian_34s" = 34;
        "beidian_39s" = 39;
        "beidian_41s" = 41;
        "beidian_42s" = 42;
        "beidian_51s" = 51;
        "beidian_54s" = 54;
        "beidian_63s" = 63;
        "beidian_66s" = 66;
        "beidian_78s" = 78;
        "beidian_79s" = 79;
        "beidian_80s" = 80;
        "beidian_89s" = 89;
        "beidian_8s" = 8;
        "beidian_94s" = 94;
        "beidian_95s" = 95;
        "beidian_96s" = 96;
        "beidian_97s" = 97;
        "beidian_9s" = 9;
        "icon_shortcuts" = 5;
        "shop_icon_shortcuts" = 2;
    };
}
2018-12-11 16:54:59.617438+0800 beidian[21871:1546688] CrashFuse -==- (null)
2018-12-11 16:54:59.617783+0800 beidian[21871:1546688] PodBundle -==- (null)
2018-12-11 16:54:59.617942+0800 beidian[21871:1546688] ServerClock -==- (null)
2018-12-11 16:54:59.618136+0800 beidian[21871:1546688] Store -==- (null)
2018-12-11 16:54:59.618877+0800 beidian[21871:1546688] BankCardOcr -==- (null)
2018-12-11 16:54:59.619247+0800 beidian[21871:1546688] BeidaiSDK -==- (null)
2018-12-11 16:54:59.619857+0800 beidian[21871:1546688] UserIdentify -==- (null)
2018-12-11 16:54:59.620297+0800 beidian[21871:1546688] Aftersale -==- (null)
2018-12-11 16:54:59.620748+0800 beidian[21871:1546688] IM -==- {
    "api_url" = "http://api.beibei.com/gateway/route.html";
    tag = ibd;
    udid = 79567444dca4b46bf4e09e3d8efbc360682b72f5;
    "user_id" = 61076596;
}