local keys = keys

keys.command_mode = {
  ['ctrl+s'] = io.save_file,
  ['ctrl+q'] = quit,
  ['v'] = function()
    		ui.statusbar_text = _RELEASE
        end,
  ['h'] = buffer.char_left,
  ['j'] = buffer.line_up,
  ['k'] = buffer.line_down,
  ['l'] = buffer.char_right,
  ['a'] = buffer.page_up,
  ['f'] = buffer.page_down,
  ['s'] = buffer.para_up,
  ['d'] = buffer.para_down,
  ['x'] = buffer.clear,
  ['i'] = function()
	    keys.mode = nil
	    ui.statusbar_text = 'INSERT MODE'
	  end,
  ['f8'] = function()
    keys.mode = nil
    ui.statusbar_text = 'INSERT MODE'
  end
}
keys['esc'] = function() keys.mode = 'command_mode' end

keys['f8'] = function() 
  keys.mode = 'command_mode'
  ui.statusbar_text = 'COMMAND MODE'
end

events.connect(events.UPDATE_UI, function()
	if keys.mode == 'command_mode' then 
    ui.statusbar_text = 'COMMAND MODE'
  return end
	ui.statusbar_text = 'INSERT MODE'
end)

keys.mode = 'command_mode' -- default mode

textadept.file_types.extensions.inc = 'asm'
