//index.js
//获取应用实例
var app = getApp()
Page({
  data: {
    motto: 'Hello World hbzs',
    userInfo: {}
  },
  //事件处理函数
  bindViewTap: function () {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  onLoad: function (options) {
    console.log('onLoad')
    var that = this
    //调用应用实例的方法获取全局数据
    app.getUserInfo(function (userInfo) {
      //更新数据
      that.setData({
        userInfo: userInfo
      })
      that.update()
    })
  },
  onReady: function () {
    console.log('on ready')
  },
  onShow: function () {
    console.log('on show')
  },
  onHide: function () {
    console.log('on hide')
  },
  onUnload: function () {
    console.log('on unload')
  }
})
