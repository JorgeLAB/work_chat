class InvitesController < ApplicationController
  before_action :load_invite, only: :show

  def create
    team = Team.find(params[:team_id])
    @invite = team.invites.build(user: user_by_email, due_date: 1.day.from_now.end_of_day)
    authorize! :create, @invite
    json_status = save_invite
    render json: {}, status: json_status
  end


  def show
    authorize! :show, @invite
  end


  private


  def save_invite
    if @invite.save
      send_email
      :ok
    else
      :unprocessable_entity
    end
  end


  def send_email
    InviteMailer.send_invite(@invite).deliver_now
  end


  def user_by_email
    User.find_by(email: params[:invite][:email])
  end


  def load_invite
    Invite.find(params[:id])
  end
end
