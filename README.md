
# MagicOS Media Pack (Honor Spec)

`呢個係一個由 EMUI 3 ~ HarmonyOS 2 以及 MagicOS 9.0 提取出嚟嘅系統鈴聲同提示音合集`  
`This is a collection of system ringtones and notification sounds extracted from EMUI 3 ~ HarmonyOS 2 and MagicOS 9.0`

----

### KernelSU / Magisk (Shamiko Whitelist Mode) 用家
要使佢生效，你需要掛載並修改以下項目  
To make it work, you’ll need to mount and modify the following items:

如果已經開咗 Magisk 介面 **限制 root 用戶權限**，請務必俾佢完整權限喔

**必須 / Required**  
```
android - 系統 / System
com.android.systemui - 系統介面 / SystemUI
com.android.providers.media 
com.android.providers.media.module - 媒體選擇器 / Media Picker
```

**AOSP / 類原生**  
```
com.android.soundpicker - 聲音 / Sound Picker
```

**MIUI / HyperOS**  
```
com.android.thememanager - 主題桌布 / Theme Manager
```

**其他更多類型嘅韌體需要你嘅提供...**  
**Other types of firmware need your contribution...**

