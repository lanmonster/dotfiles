return {
	dir = "/home/wkl/personal/pear",
	config = function()
		local pear = require("pear")
		local create_pear = pear.create_pear
		pear.setup({
			pears = {
				create_pear("py", function(filename)
					local parts = vim.split(filename, "_")
					if parts[1] == "test" then
						return table.concat({ unpack(parts, 2) }, "_")
					end
					return "test_" .. table.concat(parts, "_")
				end),
				create_pear("lua", function(filename)
					if filename == "init.lua" then
						return "test.lua"
					end
					return "init.lua"
				end),
			},
		})
	end,
}
