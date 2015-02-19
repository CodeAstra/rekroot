@bindCardsToDetails = ->
  $('.applicant_card').click ->
    $($(@)[0].dataset.target).click()

$ ->
  bindCardsToDetails()


#   this.bindCardsToDetails = function() {
#     return $('.applicant_card').click(function() {
#       return $($(this)[0].dataset.target).click();
#     });
#   };

# $(function() {
#   return bindCardsToDetails();
# });