return {
	"nvim-treesitter/nvim-treesitter", 
	build = ":TSUpdate",
	config = function () 
	  ensure_install = {"lua", "c", "python"}
          sync_install = false
          highlight = { enable = true }
          indent = { enable = true } 
    	end
}
