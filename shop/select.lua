ts_enterprise_lib = require("ts_enterprise_lib")
assert(ts_enterprise_lib,"无法引入企业专用库")
local sz = require("sz")
local json = sz.json

--表转字符串
function TableToStr(t)
	if t == nil then return "" end
	local retstr= "{"
	local i = 1
	for key,value in pairs(t) do
		local signal = ","
		if i==1 then
			signal = ""
		end
		if key == i then
			retstr = retstr..signal..ToStringEx(value)
		else
			if type(key)=='number' or type(key) == 'string' then
				retstr = retstr..signal..'['..ToStringEx(key).."]="..ToStringEx(value)
			else
				if type(key)=='userdata' then
					retstr = retstr..signal.."*s"..TableToStr(getmetatable(key)).."*e".."="..ToStringEx(value)
				else
					retstr = retstr..signal..key.."="..ToStringEx(value)
				end
			end
		end
		i = i+1
	end
	retstr = retstr.."}"
	return retstr
end

--查找
function selectData(phone_Id)
	local table_id = '5cc2819fe18c99003a7e332b'     
	local where = {phone=phone_Id}                --    
	local timeout_seconds = 30                          
	local ok,ret = ts_enterprise_lib:cloud_db_query(table_id,where,timeout_seconds)
	if ok then
		local table = ret["rows"]
		local value = table[1]["work_status"]
		return value
	end
end

--商品状态
function selectItemStatus()
	local item_name_table = {}
	local item_status_table = {}
	local table_id = '5cc6badd8427ef003a5a1a73'     
	local where = {status="Y"}                --    
	local timeout_seconds = 30                          
	local ok,ret = ts_enterprise_lib:cloud_db_query(table_id,where,timeout_seconds)
	if ok then	
		if ret["count"]~=0 then
			for i=1,ret["count"] do
				local tableRows = ret["rows"]
				table.insert(item_name_table,tableRows[i]["item"])
				table.insert(item_status_table,tableRows[i]["status"])
			end
			return item_name_table,item_status_table
		else
			return 0
		end
	else
		dialog(ret)
	end
end

--卖出商品
function delItem(name)
	local table_id = '5cc6badd8427ef003a5a1a73'         
	local where = {item=name}                              
	local timeout_seconds = 50                           
	local ok,err = ts_enterprise_lib:cloud_db_delete(table_id,where,timeout_seconds)
	if ok then
		dialog("已卖出",2)
	else
		dialog(err)
	end
end