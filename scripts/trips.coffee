module.exports = (robot) ->
  robot.respond /hi i am (.*)|hey*|hi*/i, (msg) ->
    text = msg.message.text
    out = "Yo!" + (if msg.match[1] then  " " + msg.match[1] else "")
    out += ". I am fine" if text.match(/how are|how r/i)
    msg.send out
