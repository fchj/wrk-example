--
-- script for wrk to stress test somewhere.tld/entities
-- ./wrk -t1 -c1 -d30m -s post_data_test.lua http://somewhere.tld/entities
--


local msg_template_filename = "./template.json"
local file = io.open(msg_template_filename, "r")
local template = file:read "*a"
file:close()

local counter = 1

request = function()
	local data = string.gsub(template,"###replace_id_here###",counter)
	counter = counter + 1
--	print(data)
	wrk.body = data
      return wrk.format("POST", nil, nil, data)
end
