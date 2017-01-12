# 微信小程序学习笔记

- js 后缀：脚本文件

  - app.js：处理生命周期函数、声明全局变量等
  - 页面 js 文件：处理页面生命周期函数、获取小程序实例、声明并处理数据、响应页面交互

- json 后缀：配置文件

  - app.json：全局配置，配置小程序由哪些页面组成，配置小程序窗口背景色、导航条样式、默认标题等
  - 不可添加注释
  - 页面 json 文件：非必要

- wxss 后缀：样式表文件

  - app.wxss：公共样式表
  - 页面组件的 class 属性上使用
  - 页面 wxss 文件：非必要

- wxml 后缀：页面结构文件

  - 使用 `<view/>、<image/>、<text/>` 等搭建页面结构，绑定数据和交互处理函数

  - ```html
    <block wx:for-items="{{logs}}" wx:for-item="log">
      <text class="log-item">{{index + 1}}. {{log}}</text> 
    </block>
    ```

- app.json

  - pages ：【路径 + 页面名】，第一个页面是首页

- App Launch-->App Show-->onload-->onShow-->onReady

- 路由：wx.navigateTo(OBJECT)、wx.redirectTo(OBJECT)、wx.navigateBack()

- 不可使用操作 DOM 的框架

- 提供了 WebSocket

- @import 引入样式



## 参考资料

[justjavac/awesome-wechat-weapp: 微信小程	序开发资源汇总 :100:](https://github.com/justjavac/awesome-wechat-weapp)