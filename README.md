# macos_power_monitor

## 前言
由于懒得带笔记本回家，但盒盖后macOS又会睡眠，因此便有了这个脚本(轮子)。

## 正文

### 环境需求
1. bash

### 文件说明
1. auto_add_power_monitor.sh：自启动添加脚本
1. auto_del_power_monitor.sh：自启动删除脚本
1. power_monitor.sh：监听脚本

### 安装
chmod +x auto_add_power_monitor.sh
chmod +x auto_del_power_monitor.sh
chmod +x power_monitor.sh


### 大概原理
1. 通过pmset监听当前供电设备来实现。
2. 每10s检测一次
3. 需要注意的是`power_monitor.sh`中的`power_status`的获取，请先执行一次`pmset -g ps | grep "Now drawing from" | awk '{print $4}'`看看获取的结果是什么。12.6.3的环境下是`'AC`少了一个引号。

### 使用
添加 ./auto_add_power_monitor.sh
删除 ./auto_del_power_monitor.sh