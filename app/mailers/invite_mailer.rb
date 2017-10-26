class InviteMailer < ApplicationMailer
  def send_invite(invite)
    @invite = invite
    mail(to: @invite.user.email, subject: "You receive an invite for team #{@invite.team.slug}")
  end
end
