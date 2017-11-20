$(document).on 'turbolinks:load', ->
  $('.new_message').keypress (e) ->
    if e.which == 13 && e.shiftKey == false
      App.chat.send({message: $('.new_message').val()})
      $('.new_message').val("")
    return

  window.monitor_chat($("span.team_title").html())
