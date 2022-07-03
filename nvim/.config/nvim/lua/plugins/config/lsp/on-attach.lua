return function(client)
  if client.name ~= "efm" then
    client.server_capabilities.documentFormattingProvider = false
  end
end
