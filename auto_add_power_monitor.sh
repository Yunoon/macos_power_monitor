#!/bin/bash

# 获取脚本路径和文件名
read -p "请输入您的脚本路径和文件名（例如 /Users/yourusername/Scripts/script.sh）：" script_path

# 获取用户名
read -p "请输入您的用户名：" username

mkdir /Users/"$username"/Scripts
mkdir /Users/"$username"/Scripts/logs

# 将脚本复制到指定目录
sudo cp "$script_path" /Users/"$username"/Scripts/

# 创建Property List文件
sudo bash -c 'cat > /Library/LaunchDaemons/com.'"$username"'.power_management.plist << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" \
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>com.'"$username"'.power_management</string>
    <key>ProgramArguments</key>
    <array>
      <string>/bin/bash</string>
      <string>/Users/'"$username"'/Scripts/'"$(basename "$script_path")"'</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
  </dict>
</plist>
EOF'

sudo chmod 644 /Library/LaunchDaemons/com."$username".power_management.plist

# 加载Property List到LaunchDaemons
sudo launchctl load /Library/LaunchDaemons/com."$username".power_management.plist

# 启动脚本
sudo launchctl start com."$username".power_management

echo "成功将脚本添加到自启动项中！"

