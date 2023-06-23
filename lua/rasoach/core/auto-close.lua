local status, auto_close = pcall(require, "autoclose")
if not status then
  return
end

auto_close.setup()
