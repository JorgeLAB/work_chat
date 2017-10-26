$(document).on 'turbolinks:load', ->
  $(".invite_user").on 'click', (e) =>
    $('#invite_user_modal').modal('open')
    $('#invite_team_id').val(e.target.id)
    return false

  $('.invite_user_form').on 'submit', (e) ->
    $.ajax "/teams/" +$('#invite_team_id').val()+ "/invites",
        type: 'POST'
        dataType: 'json',
        data: {
          invite: {
            email: $('#invite_email').val()
          }
        }
        success: (data, text, jqXHR) ->
          Materialize.toast('Invite Sent &nbsp;<b>:)</b>', 4000, 'green')
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problem in sent invite &nbsp;<b>:(</b>', 4000, 'red')

    $('#invite_user_modal').modal('close')
    return false
