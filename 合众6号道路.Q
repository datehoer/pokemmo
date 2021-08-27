//Call Plugin.Window.Active(656638)
Sub thinkDmCreate()
    need_ver = "3.1233"
    set ws=createobject("Wscript.Shell")
    ws.run "regsvr32 atl.dll /s"
    Set ws = nothing
    PutAttachment "c:\test_game", "*.*"
    PutAttachment ".\Plugin", "RegDll.dll"
    Call Plugin.RegDll.Reg("c:\test_game\dm.dll")
    set dm = createobject("dm.dmsoft")
    ver = dm.Ver()
    if ver <> need_ver then
        // 先释放先前创建的dm
        set dm = nothing
        // 再尝试用regsvr32 来注册. 这里必须使用绝对路径。以免有别人把dm.dll释放在系统目录.造成版本错误.
        set ws=createobject("Wscript.Shell")
        ws.run "regsvr32 c:\test_game\dm.dll /s"
        set ws=nothing
        Delay 1500  
        // 再判断插件是否注册成功
        set dm = createobject("dm.dmsoft")
        ver = dm.Ver()
        if ver <> need_ver then
            // 这时，已经确认插件注册失败了。 弹出一些调试信息，以供分析.
            messagebox "插件版本错误,当前使用的版本是:"&ver&",插件所在目录是:"&dm.GetBasePath()
            messagebox "请关闭程序,重新打开本程序再尝试"
        end if
    end if
End Sub
Function randomNum(最大值, 最小值)
    Randomize
    randomNum = Int((最大值 - 最小值 + 1) * Rnd() + 最小值)
End Function
Call thinkDmCreate()//进行大漠注册
TracePrint randomNum(2000,200)
dm_ret = dm.SetWindowState(1379608,1)
// 从pc出来
//dm.KeyDown 40
//Delay 2000
//dm.KeyUp 40
//Delay randomNum(5000, 3000)
//
//dm.KeyPress 37
//Delay randomNum(500, 300)
//
//
//dm.KeyDown 37
//Delay 1000
//dm.KeyUp 37
//timeNum = 1
While True
    For 4
        TracePrint "使用甜甜香气"
        dm.KeyPress 54
        Delay randomNum(15000,14000)
        TracePrint "战斗画面载入成功"
        dm.KeyPress 90
        Delay randomNum(500, 300)
        TracePrint "选择战斗"
        dm.keypress 40
        Delay randomNum(500, 300)
        TracePrint "选择烧尽"
        dm.KeyPress 90
        Delay randomNum(300, 200)
        TracePrint "选择攻击的精灵"
        dm.KeyPress 90
        TracePrint "战斗结束"
        Delay randomNum(20000,19000)
        timeNum = timeNum + 1
        TracePrint "已经完成" & timeNum & "次战斗"
        dm_path = dm.SetPath("c:\test_game")
		dm_ret = dm.FindPic(0,0,1024,768,"noknow.bmp","000000",0.9,0,intX,intY)
		If intX >= 0 and intY >= 0 Then
    		TracePrint "升级学习技能"
    		dm.keypress 66
    		Delay randomNum(300, 200)
    		dm.keypress 90
    		Delay randomNum(2000, 1500)
		End If
    Next
    // 瞬间移动
    dm.keypress 53
    TracePrint "返回PC"
    Delay randomNum(6000, 5000)
    // 回血
    dm.keypress 90
    Delay randomNum(2000, 1000)
    TracePrint "第1次"
    dm.keypress 90
    Delay randomNum(6000, 5000)
    TracePrint "第2次"
    dm.keypress 90
    Delay randomNum(400, 200)
    TracePrint "第3次"
    TracePrint "回血结束"
    dm.keypress 40
    Delay randomNum(400, 200)
    TracePrint "向下转动"
    // 从pc走出来
    dm.KeyDown 40
    Delay 2000
    dm.KeyUp 40
    Delay randomNum(5000, 3000)
    TracePrint "开始左转"
    For 5
        dm.keypress 37
        Delay randomNum(300, 200)
    Next
    TracePrint "开始向上"
    For 9
        dm.keypress 38
        Delay randomNum(300, 200)
    Next
    TracePrint "左转"
    dm.keypress 51
    Delay randomNum(400, 200)
    dm.keydown 37
    Delay 3650
    dm.keyup 37
    Delay 300
Wend

// 合众6号道路，3自行车，5瞬间移动，6甜甜香气
// 在草丛启动脚本
// 一下秒杀三只精灵，或者自己加判断。
// 我使用的炒炒猪，买的烧尽，一下秒掉，给其余的精灵学习装置即可，推荐练一只暴鲤龙，打这个道馆很简单。
