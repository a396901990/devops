官网：[https://docs.fastlane.tools/](http://note.youdao.com/)

对于Android打包，只需要阅读文档中的Android，Action，Advanced

### 流程
* before_all：
    * 拉取代码
    * 设置slack的URL
    * clean项目
* deploy_beta / deploy_prod:
    * 设置build type（debug，release）
* build
    * 创建assets文件夹，生成reactnative用的bundle文件
    * gradle clean
    * gradle assemble
    * 上传生成包到hockey app
* after_all:
    * clean项目
    * 发送成功消息到slack
* error
    * 发送失败消息和错误原因到slack

### 使用
cd到fastlane目录，执行:
`fastlane deploy_beta version:${VERSION} build:${BUILD}`
```:
