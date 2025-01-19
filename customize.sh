#!/system/bin/sh
# 注意 这不是占位符！！这个代码的作用是将模块里的东西全部塞系统里，然后挂上默认权限
SKIPUNZIP=0

ui_print "************************"
ui_print " :) Please wait ..."


# 定义函数check_android
check_android() {
  ui_print "** 正在检查安卓版本"
  # 获取安卓版本
  API=$(getprop ro.build.version.sdk)

  # 定义安卓版本和代码名称
  AndroidVer=""
  CodeName=""

  # 判断安卓版本
  if [ "$API" -lt 14 ]; then
    ui_print "过低的安卓版本 < Android 4.0"
    exit 1
  elif [ "$API" -eq 14 ] || [ "$API" -eq 15 ]; then
    AndroidVer="4.0.1 - 4.0.4"
    CodeName="Ice Cream Sandwich"
  elif [ "$API" -ge 16 ] && [ "$API" -le 18 ]; then
    AndroidVer="4.1.x - 4.3.x"
    CodeName="Jelly Bean"
  elif [ "$API" -eq 19 ]; then
    AndroidVer="4.4 - 4.4.4"
    CodeName="KitKat"
  elif [ "$API" -eq 21 ] || [ "$API" -eq 22 ]; then
    AndroidVer="5.0 - 5.1"
    CodeName="Lollipop"
  elif [ "$API" -eq 23 ]; then
    AndroidVer="6.0"
    CodeName="Marshmallow"
  elif [ "$API" -eq 24 ] || [ "$API" -eq 25 ]; then
    AndroidVer="7.0 - 7.1"
    CodeName="Nougat"
  elif [ "$API" -eq 26 ] || [ "$API" -eq 27 ]; then
    AndroidVer="8.0.0 - 8.1.0"
    CodeName="Oreo"
  elif [ "$API" -eq 28 ]; then
    AndroidVer="9"
    CodeName="Pie"
  elif [ "$API" -eq 29 ]; then
    AndroidVer="10"
    CodeName="Quince Tart"
  elif [ "$API" -eq 30 ]; then
    AndroidVer="11"
    CodeName="Red Velvet Cake"
  elif [ "$API" -eq 31 ]; then
    AndroidVer="12"
    CodeName="Snow Cone"
  elif [ "$API" -eq 32 ]; then
    AndroidVer="12"
    CodeName="Snow Cone v2"
  elif [ "$API" -eq 33 ]; then
    AndroidVer="13"
    CodeName="Tiramisu"
  elif [ "$API" -eq 34 ]; then
    AndroidVer="14"
    CodeName="Upside Down Cake"
  elif [ "$API" -eq 35 ]; then
    AndroidVer="15"
    CodeName="Vanilla Ice Cream"
  else
    AndroidVer="> 15"
    CodeName="Unknown"
  fi

  # 显示安卓版本信息
  ui_print "   - API: $API"
  ui_print "   - Android: $AndroidVer"
  ui_print "   - CodeName: $CodeName"
}

# 调用check_android函数
check_android

# 判断安卓版本是否大于30
if [ "$API" -gt 30 ]; then
  # 检查vendor文件夹是否存在，不存在则创建
  if [ ! -d "$MODPATH/system/vendor" ]; then
    mkdir -p "$MODPATH/system/vendor"
  fi

  # 移动media文件夹到vendor目录
  mv "$MODPATH/system/media" "$MODPATH/system/vendor/"

  # 显示完成操作
  ui_print "   - Detected Android 11+"
  ui_print "   - Media folder moved to vendor directory. [from /system/media to /system/vendor/media.]"
else
  # 显示不需要移动
  ui_print "   - No need to move media folder. API level is $API!"
fi

ui_print "************************"
