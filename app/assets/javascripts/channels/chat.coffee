window.current_chat = {}

window.change_chat = (id, type, team_id) ->
  if App.chat != undefined
    App.chat.unsubscribe()

  window.current_chat = { type: type, id: id }

  App.chat = App.cable.subscriptions.create { channel: "ChatChannel", id: id , type: type, team_id: team_id},
    received: (data) ->
      window.add_message(data.message, data.date, data.name)

window.monitor_chat = (team_slug) ->
  App.chat_monitor = App.cable.subscriptions.create { channel: "ChatMonitorChannel", slug: team_slug },
    received: (data) ->
      if(window.current_chat.type != data.type || parseInt(window.current_chat.id) != data.id)
        window.highlight_chat(data.type, data.id)
