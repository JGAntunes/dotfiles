return {
  -- disable hover in favour of pyright
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
  end,
}
