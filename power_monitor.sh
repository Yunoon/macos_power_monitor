#!/bin/bash

while true; do
    # 获取当前电源状态
    power_status=$(pmset -g ps | grep "Now drawing from" | awk '{print $4}')
    echo $power_status    
    # 如果当前电源状态为“AC Power”，禁止睡眠
    if [ "$power_status" = "'AC" ]; then
        sudo pmset -b sleep 0
        sudo pmset -b disablesleep 1
	echo "AC On! Disablesleep!"
    # 如果当前电源状态为“Battery Power”，允许睡眠
    elif [ "$power_status" = "'Battery" ]; then
        sudo pmset -b sleep 0
        sudo pmset -b disablesleep 0
	echo "AC Off! Enablesleep!"
    fi

    # 每隔10秒检查一次电源状态
    sleep 10
done

