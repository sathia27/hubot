request = require 'request'
_ = require "underscore"

module.exports = (robot) ->
  robot.hear /maximum number of tickets|maximum tickets|maximum travelers/i, (msg) ->
    send_message msg, robot, "A maximum of 9 seats can be booked at one time. If you need to book for more than 9 travelers you will have to re–complete the booking process for the additional travelers."

  robot.hear /(loyalty program)|(loyalty programmes)/i, (msg) ->
    send_message msg, robot, "No, but there are attractive offers running on the homepage. Stay sharp and you might grab a great deal."

  robot.hear /no (.*) results|no results/i, (msg) ->
    send_message msg, robot, "Clear your browser cache and try the search again. If you still don’t get any flight results, it may either be because we can’t find flights for that route or because there’s no availability of flights for your dates."

  robot.hear /seat* arrangement|seat* arrangement|choose seat*|choose birth*|/i, (msg) ->
    text = msg.message.text
    if text.match(/flight/)
      send_message msg, robot, "Cleartrip doesn’t do pre–seating. Some airlines will confirm your seat assignments – their rules for doing so vary – so call your airline directly to check whether you get to choose your seat"
    else if text.match(/trains/)
      send_message msg, robot, "Sorry, you can’t. The berths and coaches are allotted by Indian Railways and we have no control over this allocation."

  robot.hear /checkin|check-in|check in/i, (msg) ->
    text = msg.message.text
    if text.match(/hotel*/) and text.match(/time/)
      send_message msg, robot, "Typically, the hotel check–in time is after 2:00 pm (local hotel time). Check with your specific hotel for its exact check–in time."

   robot.hear /id proof/i, (msg) ->
     send_message msg, robot, "we strongly recommend that you carry a government–issued photo–id proof with you "

   robot.hear /(hotel*|restaurants) (near|nearby) (.*)/, (msg) ->
      console.log "!!!!1"
      place = msg.match[3]
      console.log place
      request.get url:'http://sw-search.cltp.com:9001/r1/smallworld-search/search/swplaces?qp=strict&qs=' + place , (err,httpResponse,body) ->
        json_response = JSON.parse(body)
        json_response = _.initial(json_body, 5)
        msg.send json_response

   robot.hear /hi/i, (msg) ->
     send_message msg, robot, "Yo!"


send_message = (msg, robot, text) ->
  user = msg.message.user
  console.log user
  data = {"message": text, "password": "wonderful", "action": "sendMessage", "from": "YOURNAME", "to": [parseInt(user)]}
  request.post url:'http://localhost/WhatsAPI/examples/whatsapp.php', form: data, (err,httpResponse,body) ->
    console.log body
    msg.send text
