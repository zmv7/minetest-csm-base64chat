core.register_on_receiving_chat_message(function(message)
    message = core.strip_colors(message)
    local text
    local sender, data = message:match("(%S+[:?>?])%s?(.+)")
    if data then
        text = core.decode_base64(data)
    end
    if text and sender then
        core.after(0.1,function()
            core.display_chat_message(core.colorize('#FF0','Base64: '..sender).." "..text)
        end)
    end
end)
core.register_chatcommand("b64", {
    description = "Say in base64",
    func = function(param)
        core.send_chat_message(core.encode_base64(param))
end})
