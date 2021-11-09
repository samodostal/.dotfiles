return function()
  local tabnine = require('cmp_tabnine.config')
  tabnine:setup({
    max_lines = 2000;
    max_num_results = 50;
    sort = true;
    run_on_every_keystroke = true;
    snippet_placeholder = 'tabnine...';
  })
end

