<!DOCTYPE html>
<html>

<head>
    <title>我的</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" type="text/css"  href="${request.contextPath}/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/css/page/index.css" />
    <script src="${request.contextPath}/js/jquery-2.1.0.js"></script>
    <script src="${request.contextPath}/js/vue.min.js"></script>
    <script src="${request.contextPath}/js/config.js"></script>
</head>
<body>
<div id="app">
    <div class="app-content">
        <div class="user-bg">
            <div class="user-bar">
                <div class="border">
                    <div class="user-head"></div>
                </div>
                <div class="user-name" v-if="userInfo.idCard == null || userInfo.idCard == ''">暂未实名</div>
                <div class="user-name" v-if="userInfo.idCard != null && userInfo.idCard != ''">{{userInfo.userName}}</div>
                <div class="user-credit">
                    <i></i>
                    <span>{{userInfo.creditPoints == null ? 0 : userInfo.creditPoints}}</span>
                </div>
                <div class="user-phone">{{userInfo.phone}}</div>
            </div>
        </div>

        <div class="state-bar">
            <div class="row">
                <div class="item item-1">
                    <i></i>
                    <span class="hint">待还</span>
                    <span class="money">{{userInfo.nowToBePaidJoinPrice == null ? 0 : userInfo.nowToBePaidJoinPrice}}</span>
                </div>
                <div class="item">
                    <i></i>
                    <span class="hint">待收</span>
                    <span class="money">{{userInfo.nowToBePaidOutPrice == null ? 0 : userInfo.nowToBePaidOutPrice}}</span>
                </div>
            </div>
        </div>

        <div class="menu-bar">
            <div class="menu-row">
                <div class="menu-item" @click="setUrl('loanApplication?type=1', 1)">
                    <div class="menu-icon"></div>
                    <div class="menu-name">求借款</div>
                </div>
                <div class="menu-item" @click="setUrl('loanApplication?type=0', 1)">
                    <div class="menu-icon"></div>
                    <div class="menu-name">去出借</div>
                </div>
                <div class="menu-item" @click="setUrl('myBorrow', 1)">
                    <div class="menu-icon"></div>
                    <div class="menu-name">待还</div>
                </div>
                <div class="menu-item" @click="setUrl('findCredit', 1)">
                    <div class="menu-icon"></div>
                    <div class="menu-name">查信用</div>
                </div>
                <div class="menu-item" @click="setUrl('myBorrowOut', 1)">
                    <div class="menu-icon"></div>
                    <div class="menu-name">待收</div>
                </div>
                <div class="menu-item" @click="setUrl('setting', 0)">
                    <div class="menu-icon"></div>
                    <div class="menu-name">设置</div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
<script>
    config.reload();
    var app = new Vue({
        el: '#app',
        data: {
            userInfo : [],
        },
        methods: {
            /**获取用户信息**/
            getInfo : function () {
                var _self = this; //TODO 为了区分Ajax this 把vue  this 存起来
                config.ajaxRequestData(false, "wechat/user/info", {}, true, function (result) {
                    _self.userInfo = result.data;
                    $(".user-avatar").css("background", "url(" + _self.userInfo.avatar + ")");
                    localStorage.setItem("userInfo", JSON.stringify(_self.userInfo));
                });
            },
            /**跳转**/
            setUrl : function (url, type) {
                var _self = this;
                if (type == 1) {
                    if (this.userInfo.idCard == null || this.userInfo.idCard == "") {
                        location.href = config.ip + "wechat/page/personData";
                    }
                    else {
                        if (url == "loanApplication?type=0") {
                            this.getInfo();
                            if (this.userInfo.isFromUser == null || this.userInfo.isFromUser == 0 || this.userInfo.isFromUser == 3) {
                                config.prompt("是否立即申请为出借人？","请输入申请内容", ["取消", "确认"], "text", function (index) {
                                    if (index == 1) {
                                        if ($(".app-modal-input").val() == "") {
                                            config.toast("请输入申请内容");
                                        }
                                        else {
                                            config.ajaxRequestData(false, "wechat/user/update", {
                                                isFromUser : 2,
                                                remark : $(".app-modal-input").val()
                                            }, true, function () {
                                                config.toast("提交成功，请耐心等待审核");
                                            });
                                        }
                                    }
                                });
                                $(".app-modal-input").css("height", "80px");
                            }
                            else if (this.userInfo.isFromUser == 2) {
                                config.toast("审核中，请稍后.");
                            }
                            else if (this.userInfo.isFromUser == 1) {
                                location.href = config.ip + "wechat/page/" + url;
                            }
                        }
                        else {
                            location.href = config.ip + "wechat/page/" + url;
                        }
                    }
                }
                else {
                    location.href = config.ip + "wechat/page/" + url;
                }
            }
        }
    });
    app.getInfo();
</script>

</html>
