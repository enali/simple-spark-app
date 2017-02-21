# simple-spark-app

主要是添加了`Rake`任务, 便于在本地开发后直接推送并执行`spark-submit`. 

请确保安装`ruby`以及`rake`, 执行`which ruby`和`which rake`确认.

`spark.json`是远程服务器和`spark-submit`的执行参数.

`Rakefile`是定义的`rake`任务, 非常简单, 可执行`rake -AT`查看当前支持的任务及说明.

`rblib/*.rb`是`Rakefile`依赖的两个库文件, `sbt.rb`负责从`build.sbt`中提取项目信息,
`spark.rb`负责解析`spark.json`的配置信息.

## 开始

1, `sbt assembly`打包

2, `rake`推送`Jar`包到远程主机并执行`spark-submit`
