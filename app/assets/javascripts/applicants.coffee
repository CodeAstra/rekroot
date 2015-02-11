@bindCardsToDetails = ->
  $('.applicant_card').click ->
    $($(@)[0].dataset.target).click()

$ ->
  bindCardsToDetails()