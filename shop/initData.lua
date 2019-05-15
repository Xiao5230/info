require ("TSLib")
init(1) 
--获取手机设备号
function checkUDID()
	local UDID = sz.system.udid()
	return UDID
end

--初始化数据 
function VeiwUI()
	w,h = getScreenSize()
	UINew({titles="初始化数据",okname="运行脚本",cancelname="退出脚本"}) 
	UILabel("手机状态","15","left")
	UICombo("name","Y,N")
	UILabel("手机表","15","left")
	UITextArea("phoneID","输入Id","",15,"left","0,0,255","default",-1,"0",40)
	UILabel("商人表","15","left")
	UITextArea("businessmanID","输入Id","",15,"left","0,0,255","default",-1,"0",40)
	UILabel("账号表","15","left")
	UITextArea("accountID","输入Id","",15,"left","0,0,255","default",-1,"0",40)
	UIShow()
end

--手机状态
function setStatus()
	if name=="Y" then
		return "Y"
	elseif name=="N" then
		return "N"
	end
end

--商品表id
function setItemId()
	if businessmanID=="" then
		dialog("非法值")
	else
		return businessmanID
	end
end

--获数据库表ID
function setPhone_Id()
	if phoneID=="" then
		dialog("非法值")
	else
		return phoneID
	end
end

--设置手机信息
function initStatus()
	local Phone_Id = checkUDID()      --设备号
	local phone_Status = setStatus()    --UI单选手机状态
	selectItemStatus(Phone_Id,phone_Status)
end

--添加手机并设置手机状态
function selectItemStatus(phoneId,phoneStatus)
	local table_id = setPhone_Id()    --'5cc6badd8427ef003a5a1a73'   设置表ID
	local where = {phone=phoneId,work_status=phoneStatus}     --添加设备号
	local timeout_seconds = 30
	local ok,err = ts_enterprise_lib:cloud_db_add(table_id,data,timeout_seconds)
	if ok then
		toast("添加成功")
	else
		dialog(err)
	end
end