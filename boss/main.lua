require ("TSLib")
require("select")
require("account")
init(1)
SQL = require("ts_enterprise_lib")
assert(SQL,"无法引入企业专用库")
升序 = {{523,94,0x292818},{520,97,0x3a2614},{519,99,0x3c332b},{517,101,0x3c281f},{530,100,0x969483},{529,98,0x2e2d1c},{525,94,0x5a5a49},{526,94,0x292312},{527,96,0xa8a897},{532,103,0x759291},}
降序 = {{517,96,0x739190},{518,98,0x575645},{520,101,0x252514},{522,103,0xa3a392},{523,104,0xdbdbca},{524,104,0xddddcc},{527,104,0x222211},{529,102,0x392513},{530,100,0x383027},{531,99,0x2d1b11},}
贝壳不足={{417,470,0x60713e},{416,505,0x60713e},{561,472,0x60713e},{562,516,0x60713e},{494,486,0x807466},{494,496,0x897d6e},{516,497,0xc0b09e},{524,500,0xf7e3ce},{524,493,0xe0ceba},{517,488,0xd8c5b2},}

local timeout = 50
local sql_tableId = '5cc2819fe18c99003a7e332b' 
local sz = require("sz")
--设备号
local UDID = {"865002023149222","863583028777242"}
local phone = {"phone_one","phone_two"}

local allStatus = {
	{"Y","N"},
	{"N","Y"},
}

--更新活动设备
function UpDataPhone(number)
	for Id = 1,#allStatus do
		local where = {phone=phone[Id]}
		local data = {work_status=allStatus[number][Id]}   
		local ok,err = SQL:cloud_db_update(sql_tableId,where,data,timeout)
		if ok then
			toast(number.."号手机第"..Id.."条记录修改",1)
		else
			dialog(err)
		end
	end
end

----检查手机设备号
function checkUDID()
	local UDID = sz.system.udid()
	return UDID
end


--手机列表
function table_PhoneId(uuid)
	if uuid=="865002023149222" then
		return "phone_one"
	elseif uuid=="863583028777242" then
		return "phone_two"
	else
		dialog("没有您要找的手机ID:"..uuid.."，停止脚本")
		lua_exit()
	end
end

--购买商品
function shop()
	while true do
		local item_name_shoptable,item_status_shoptable = selectItemStatus()
		if type(item_name_shoptable)~="number" then	
			for i=1,#item_status_shoptable do
				--获取字符串最后一位
				local str = string.sub(item_name_shoptable[i],-1,-1)
				--删除字符串最后一位
				local str_name = string.sub(item_name_shoptable[i], 1, -2)
				shopping(str_name,str)
			end
		else
			toast("商品未上架")
		end
		mSleep(2000)
	end
end

function ActivePhone()
	while true do 
		local active = checkUDID()
		local table_Id = table_PhoneId(active)
		local result = selectData(table_Id)
		if result=="Y" then
			shop()
		elseif result=="N" then
			dialog("非购买状态",1)
			mSleep(1000)
		end
	end
	mSleep(1000)
end


--刷新上架物品
function refreshItem()
	mSleep(1000)
	tap(190,545)   --其他道具
	mSleep(1000)
	tap(576,405)   --求救信
	mSleep(1000)
	tap(466,97)    --全部
end

--找具体物品
function handleItem(set_name)
	if set_name=="幼年九尾求救信" then
		refreshItem()
		mSleep(1000)
		tap(456,210)   --幼年九尾求救信
	elseif set_name=="幼年暴龍求救信" then
		refreshItem()
		mSleep(1000)
		tap(451,269)   --幼年暴龍求救信
	elseif set_name=="幼年翼龍求救信" then
		refreshItem()
		mSleep(1000)
		tap(465,325)   --幼年翼龍求救信
	elseif set_name=="韋帕斯求救信" then
		refreshItem()
		mSleep(1000)
		tap(465,378)   --韋帕斯求救信
	else
		dialog("没有您要找物品",5)
		return ""
	end
end

--购买商品
function shopping(setitemname,finalString)
	local activePH = checkUDID()
	mSleep(500)
	tap(909,35)     --交易
	mSleep(1500)
	tap(614,288)     --交易所
	mSleep(1500)
	tap(206,214)     --极品宠物，全部商品
	mSleep(1500)
	tap(559,193)     --全部
	mSleep(1000)
	x,y=findMultiColorInRegionFuzzyByTable(升序,90,481,79,557,120)
	if x~=-1 and y~=-1 then
		mSleep(1000)
		tap(525,97)     --降序
		mSleep(1000)
		tap(463,656)    --搜索商品
		mSleep(1000)
		inputText(setitemname)
		mSleep(2000)
		tap(1166,658)   --确认输入
		mSleep(2000)
		tap(531,364)    --确认搜索的商品
		mSleep(1000)
		handleItem(setitemname)
		mSleep(1000)
		tap(532,180)   --第一栏位
		mSleep(1000)
		tap(788,605)     --购买
		mSleep(1000)
		x,y=findMultiColorInRegionFuzzyByTable(贝壳不足,90,412,466,574,525)
		if x~=-1 and y~=-1 then
			mSleep(1000)
			--当前活动的设备

			changeID(activePH)
			mSleep(3000)
			indexlogin()
		else
			mSleep(1000)
			tap(1136,70)
			local final = setitemname..finalString
			delItem(final)
			mSleep(500)
			dialog("删除商品"..setitemname,1)
		end
	else
		mSleep(1000)
		tap(463,656)    --搜索商品
		mSleep(1000)
		inputText(setitemname)
		mSleep(2000)
		tap(1166,658)   --确认输入
		mSleep(2000)
		tap(531,364)    --确认搜索的商品
		mSleep(1000)
		handleItem(setitemname)
		mSleep(1000)
		tap(532,180)   --第一栏位
		mSleep(1000)
		tap(788,605)     --购买
		mSleep(1000)
		x,y=findMultiColorInRegionFuzzyByTable(贝壳不足,90,412,466,574,525)
		if x~=-1 and y~=-1 then
			mSleep(1000)
			changeID(activePH)
			mSleep(3000)
			indexlogin()
		else
			mSleep(1000)
			tap(1136,70)
			local final = setitemname..finalString
			delItem(final)
			dialog("删除商品"..setitemname,1)
		end
	end	
end

--韋帕斯求救信1
ActivePhone()

