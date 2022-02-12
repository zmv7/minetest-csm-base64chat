minetest.register_on_receiving_chat_message(function(message)
local text
local sender = message:match('%S+[:?>?] ')
local csender = message:match('%S+[:?>?] .+%(.+%)')
if csender then
local data = message:gsub('[%a*%d*]+[:?>?] .+%(?.+%)','')
text = core.decode_base64(data)
elseif sender then
local data = message:gsub('[%a*%d*]+[:?>?] ','')
text = core.decode_base64(data)
end
if text then
minetest.after(0.1,function()
   core.display_chat_message(minetest.colorize('#FF0','Base64: '..sender)..text)
end)
end
end)
minetest.register_chatcommand("b64", {
    description = "Say in base64",
    func = function(param)
core.send_chat_message(core.encode_base64(param))
end})
