require ("TSLib")
init(1) 
local sz = require("sz")
--引入中控库
ts_enterprise_lib = require("ts_enterprise_lib")
assert(ts_enterprise_lib,"无法引入企业专用库")

账号登陆 = {
	{ 1176,   30, 0xb8a896},    --90, 1121, 15, 1261, 60   
	{ 1173,   34, 0xcbbaa8},
	{ 1173,   40, 0xcbbaa8},    -- 1176,   32
	{ 1178,   34, 0xf2deca},
	{ 1178,   40, 0xf6e1ce},
	{ 1176,   44, 0xf6e2ce},
	{ 1181,   31, 0xf7e3ce},
	{ 1186,   31, 0xf3dfca},
	{ 1181,   45, 0xb0a190},
	{ 1186,   45, 0x494036},
}
--90,398,394,471,469
连接邮箱 = {{418,416,0xe34856},{415,443,0xe35151},{421,444,0xff9191},{422,428,0xedb8c9},{431,428,0xdd2222},{431,434,0xba3232},{436,427,0xe02525},{431,426,0xef9a9a},{422,424,0xdb1e28},{432,430,0xdd2222},}
邮箱 = {{406,406,0xffffff},{406,450,0xffffff},{415,437,0xdd2222},{428,429,0xdd2222},{446,427,0xdb1e28},{577,408,0xffffff},{588,459,0xffffff},{860,408,0xffffff},{859,433,0xffffff},{710,430,0x878787},}

登陆账号 = {
	{  379,  393, 0x1e1e1e},    --90, 372, 378, 911, 462
	{  383,  450, 0x1e1e1e},    --636,  433
	{  905,  386, 0x1e1e1e},
	{  900,  449, 0x1e1e1e},
	{  650,  406, 0x6c6c6c},
	{  643,  430, 0x919191},
	{  670,  431, 0xffffff},
}

其他账号 = {
	{548,368,0x1e1e1e},
	{547,367,0xc1c1c1},
	{546,387,0x1e1e1e},
	{567,387,0x1e1e1e},
	{579,387,0x303030},    --90,359,344,915,585
	{582,386,0xacacac},
	{581,380,0xffffff},
	{581,379,0xaaaaaa},
	{592,366,0x1e1e1e},
	{594,371,0xffffff},
}

载入 = {{616,473,0x3e4770},{615,515,0x3e4770},{844,475,0x3e4770},{842,511,0x3e4770},{444,478,0x753230},{439,510,0x753230},{570,477,0x753230},{567,508,0x753230},}
--90,403,203,877,530    755,493
email登陆 = {
	{  371,  583, 0xdd1d28},   --90, 351, 157, 929, 670  --643,  629
	{  371,  660, 0xdd1d28},
	{  590,  620, 0xf1a0a5},
	{  589,  617, 0xe86870},
	{  594,  617, 0xde202b},
	{  599,  626, 0xdd1d28},
	{  597,  630, 0xffffff},
	{  610,  630, 0xdd1d28},
	{  615,  630, 0xef969b},
	{  615,  628, 0xf6c4c7},
}
贝壳不足={{417,470,0x60713e},{416,505,0x60713e},{561,472,0x60713e},{562,516,0x60713e},{494,486,0x807466},{494,496,0x897d6e},{516,497,0xc0b09e},{524,500,0xf7e3ce},{524,493,0xe0ceba},{517,488,0xd8c5b2},}

删除账号 = {{881,290,0xa7a7a7},{877,290,0xffffff},{872,280,0xa7a7a7},{891,280,0xa7a7a7},{892,300,0xa8a8a8},{871,300,0xa8a8a8},{875,293,0xffffff},{882,293,0xffffff},{881,288,0xc2c2c2},}
--90,367,236,916,338   880,288

载入 = {{616,473,0x3e4770},{615,515,0x3e4770},{844,475,0x3e4770},{842,511,0x3e4770},{444,478,0x753230},{439,510,0x753230},{570,477,0x753230},{567,508,0x753230},}
登录游戏={{502,569,0xe9b64c},{502,626,0xcf7f30},{780,574,0xe6b049},{778,620,0xd08431},{589,586,0xa79f7d},{617,585,0xdca343},{652,585,0x46351b},{677,613,0x251e14},{636,609,0xd5cc9f},{594,601,0x958d6e},}
关闭公告 = {{1020,83,0x967463},{1024,75,0x573524},{1038,72,0x815f3d},{1055,83,0x462713},{1054,79,0x3d2c1b},{1044,66,0x453423},{1039,61,0x553419},{1024,48,0x401e0d},{1055,50,0x3f2919},{1055,53,0x432a1b},}
公告 = {{1134,45,0x000000},{1172,48,0x000000},{1146,25,0x000000},{1153,60,0x000000},{1153,45,0xffffff},{1161,36,0xa2a2a2},{1142,58,0xffffff},{1141,36,0x474747},}
EXP = {{130,75,0x3fc7b9},{135,77,0xaebf7b},{138,79,0x1769a3},{144,80,0xfa3725},{135,90,0xfff428},{133,86,0xc4c42e},{133,84,0x142532},{138,84,0x04072d},{138,93,0xddc922},{133,94,0xeac911},}


local sz = require("sz")
local UDID = {"863908025892464","860308026874103","863121022927396"}
--检查手机设备号
function checkUDID()
	local UDID = sz.system.udid()
	return UDID
end



--手机更换账号次数
function selectAccount()
	local table_id = '5cd3e615be9aa0002ff9df39'         --表id
	local username = checkUDID()
	toast(username)
	local where = {user=username}                              --条件
	local timeout_seconds = 30                           --超时
	local ok,ret = ts_enterprise_lib:cloud_db_query(table_id,where,timeout_seconds)
	if ok then
		local number = ret["rows"]
		local value = number[1]["account_number"]
		toast(value)
		return value
	else
		dialog(ret)
	end
end

--修改登录标记
function updataMark(number)
	local table_id = '5cd3e615be9aa0002ff9df39'       
	local where = {user=checkUDID()}
	local data= {account_number=number+1}
	local timeout_seconds = 30                     
	local ok,err = ts_enterprise_lib:cloud_db_update(table_id,where,data,timeout_seconds)
	if ok then
		toast("标记修改")
	else
		dialog(err)
	end
end

--读取全部账号
function accountRead()
	local path="/sdcard/account/account.txt" 
	local file = io.open(path,"r")
	if file then
		local account_tab = {}
		for account in file:lines() do
			table.insert(account_tab,account)
		end
		file:close()
		return account_tab
	end
end


--偏移点击
function tapMoveFun(x,y)
	touchDown(x,y)
	mSleep(30)
	touchUp(x,y)
	mSleep(1000)
end

--偏移坐标
function moveFun(loaclTable)
	local a = loaclTable[3]-loaclTable[1]
	local b = loaclTable[4]-loaclTable[2]
	return a,b
end

--进入游戏重载脚本
function loginGame()
	while true do
		x,y=findMultiColorInRegionFuzzyByTable(载入,90,403,203,877,530)
		if x~=-1 and y~=-1 then
			tap(x,y)
			mSleep(1000)
		else
			x,y=findMultiColorInRegionFuzzyByTable(登录游戏,90,486,556,794,641)
			if x~=-1 and y~=-1 then
				tap(x,y)
				mSleep(1000*10)
			else
				x,y=findMultiColorInRegionFuzzyByTable(关闭公告,90,1016,41,1059,90)   --银子公告
				if x~=-1 and y~=-1 then
					tap(x,y)
					toast("关闭公告1")
				else
					x,y=findMultiColorInRegionFuzzyByTable(公告,90,1120,10,1181,77)
					if x~=-1 and y~=-1 then
						tap(x,y)
						toast("关闭公告2")
					else
						x,y=findMultiColorInRegionFuzzyByTable(EXP,90,109,51,162,109)
						if x~=-1 and y~=-1 then
							dialog("重载脚本",2)
							lua_restart()
						end
					end
				end
			end
		end
		mSleep(1000)
	end
end

--第一次登陆
function oneAccount(tab,num)
	password = "money@2019"
	tap(391,204)
	mSleep(2000)
	inputText(tab[num])
	mSleep(1000)
	tap(1203,  669)
	mSleep(1500)
	tap(492,  300)
	inputText(password)
	mSleep(1000)
	tap(1203,  669)
	mSleep(1500)
	tap(625,  419)    --点击登录
	mSleep(2000)
	tap(895,168)
end

--屏幕滑动模块
--function slide()
--	local x = 630  --宽630,510
--	local y = 560 --高
--	speed = 120	
--	touchDown(x,y)
--	mSleep(30)
--	y1 = y - speed   --坐标变花后值
--	touchMove(x,y1)
--	mSleep(30)
--	touchUp(x,y1)
--end

function delccount()
	while true do
		x,y=findMultiColorInRegionFuzzyByTable(删除账号,95,367,236,916,338)
		if x~=-1 and y~=-1 then 
			x1,y1 = moveFun({881,290,880,288})
			toast("删除账号")
			tapMoveFun(x+x1,y+y1)
			mSleep(1000)
			tap(760,513)
			mSleep(500)
		else
			toast("删除完毕")
			break
		end
		mSleep(1000)
	end
end

function repalec()
	local account_table = accountRead()
	local loginnumber = selectAccount()
	while true do
		while true do
			x,y=findMultiColorInRegionFuzzyByTable(邮箱,90,397,395,881,467)
			if x~=-1 and y~=-1 then
				mSleep(1000)
				tap(637,416)
			else
				x,y=findMultiColorInRegionFuzzyByTable(连接邮箱,90, 394, 394, 888, 467)
				if x~=-1 and y~=-1 then
					toast("连接邮箱")
					tap(702,443)
					mSleep(1000)
				else
					x,y=findMultiColorInRegionFuzzyByTable(账号登陆,90,1121,15,1261,60)
					if x~=-1 and y~=-1 then 
						toast("账号登陆")
						tap(1176,32)
					else
						mSleep(1000)
						x,y=findMultiColorInRegionFuzzyByTable(删除账号,95,367,236,916,338)
						if x~=-1 and y~=-1 then 
							delccount()
						else
							x,y=findMultiColorInRegionFuzzyByTable(登陆账号,90,372,378,911,462)
							if x~=-1 and y~=-1 then 
								toast("第一次")
								oneAccount(account_table,loginnumber)
								mSleep(2000)
								updataMark(loginnumber)
								mSleep(2000)
								dialog("重新登录游戏",2)
								loginGame()
								break
							end
						end
					end
				end
			end
		end
		mSleep(1000)
	end
end

--切换账号
function indexlogin()
	mSleep(1000)
	tap(857,215)    --消费
	mSleep(1000)
	tap(1026,97)
	mSleep(1000)
	tap(1136,70)
	mSleep(1000)
	tap(1234,677)   --功能列表
	mSleep(1000)
	tap(858,461)    --设置
	mSleep(1000)
	tap(997,617)    --退出登录 
	mSleep(1000)
	tap(780,489)    --确定退出
	mSleep(1000)
	repalec()
end

--活动的手机号
function changeID(uuid)
	if uuid=="863908025892464" then
		UpDataPhone(2)
	elseif uuid=="860308026874103" then
		UpDataPhone(3)
	elseif uuid=="863121022927396" then
		UpDataPhone(1)
	else
		dialog("没有您要找的手机ID"..uuid)
	end
end
