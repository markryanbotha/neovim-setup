local dap, dapui = require "dap", require "dapui"

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { os.getenv "HOME" .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
