class ChatMonitorChannel < ApplicationCable::Channel
  def subscribed
    team = Team.find_by(slug: params["slug"])
    stream_from "monitor_chat_team_#{team.id}"
  end
end