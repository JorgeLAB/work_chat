$(document).on 'turbolinks:load', ->
  $('.button-collapse').sideNav()
  $('.modal').modal()
  $('.add_team').click () ->
    $("#add_team_modal").modal("open")
  return
