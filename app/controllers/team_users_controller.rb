class TeamUsersController < ApplicationController
  before_action :set_team_user, only: [:destroy]

  def create
    @team_user = TeamUser.new(team_user_params)
    authorize! :create, @team_user
    if @team_user.save
      redirect_to "/#{@team_user.team.slug}", notice: "Welcome to Team!"
    else
      redirect_to root_path, alert: "An error ocurred when trying to accept your invite"
    end
  end

  def destroy
    authorize! :destroy, @team_user
    @team_user.destroy

    respond_to do |format|
      format.json { render json: true }
    end
  end

  private

  def set_team_user
    @team_user = TeamUser.find_by(user_id: params[:id], team_id: params[:team_id])
  end

  def team_user_params
    params.require(:team_user).permit(:team_id).merge(user_id: current_user.id)
  end
end
