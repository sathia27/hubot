module.exports = (robot) ->
  robot.hear /after an amendment|after  amendment|cancel after amendment/i, (msg) ->
    msg.send "Yes, but do not cancel from your Cleartrip Account, call customer support and cancel the same. If you have amended your journey with us or the airline then please cancel your trip 3 hrs before your amended travel date and time."

  robot.hear /process a refund|how long process refund|how long refund/i,(msg) ->
    msg.send "We usually process the refund within 4 working days of cancellation. However, it may take slightly longer to reflect in your account statement depending upon your bank. We.ve noticed that it takes about 14 working days for most refunds to hit their respective accounts."

  robot.hear /set a fare alert|how to get fare alert|use fare alerts/i,(msg) ->
    msg.send "While setting a fare alert, there is an option to select when you are looking to travel. In that, check the radio button that says. I prefer holidays to get a drop-down list of upcoming holidays. Select the holiday you choose to travel on, and we will send you the best fares to help you book the cheapest deals for holiday travel."

  robot.hear /booking is not completed|booking not completed|what booking not completed/i,(msg) ->
    msg.send "If this happens, just take a deep breath and try again. If your booking fails in the middle of a payment process, we.ll let you know if you get slapped with any erroneous charges."

   robot.hear /vacation|holiday|weekend|getaway|summer|home town/i,(msg) ->
      msg.send "OH! Awesome!!, let me tell me you some nice places to go.. ask me hotels at any place to start with! :)"

   robot.hear /cancel my ticket|in the middle of|last date to cancel/i,(msg) ->
      msg.send "If the ticket is eligible for a refund, the EMI is cancelled and the paid amount is reversed to the card account. Please note that the Cleartrip processing charges will not be refunded and payment is subject to the cancellation charges as given in the flight booking policy."








