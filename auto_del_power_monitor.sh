#!/bin/bash

# 获取用户名
read -p "请输入您的用户名：" username

# 卸载Property List文件
launchctl unload ~/Library/LaunchAgents/com."$username".power_management.plist

# 删除Property List文件和脚本文件
rm ~/Library/LaunchAgents/com."$username".power_management.plist
rm ~/Scripts/script.sh

echo "已将脚本从自启动项中删除，并删除相关文件！"

