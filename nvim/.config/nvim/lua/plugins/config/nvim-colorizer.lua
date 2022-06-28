return function()
  local colorizer = safe_require 'colorizer'
  if not colorizer then return end

  colorizer.setup()
end
