#!/bin/bash

while true; do
    # 获取当前电源状态
    power_status=$(pmset -g ps | grep "Now drawing from" | awk '{print $4}')
    echo `date +%H:%M:%S`-$power_status >> /Users/yunoon/Scripts/logs/power_monitor-`date +%Y-%m-%d`-logs.txt
    # 如果当前电源状态为“AC Power”，禁止睡眠
    if [ "$power_status" = "'AC" ]; then
        sudo pmset -b sleep 0
        sudo pmset -b disablesleep 1
	echo `date +%H:%M:%S`-"AC On! Disablesleep!" >> /Users/yunoon/Scripts/logs/power_monitor-`date +%Y-%m-%d`-logs.txt
    # 如果当前电源状态为“Battery Power”，允许睡眠
    elif [ "$power_status" = "'Battery" ]; then
        sudo pmset -b sleep 0
        sudo pmset -b disablesleep 0
	echo `date +%H:%M:%S`-"AC Off! Enablesleep!" >> /Users/yunoon/Scripts/logs/power_monitor-`date +%Y-%m-%d`-logs.txt
    fi

    # 每隔10秒检查一次电源状态
    sleep 10
done

