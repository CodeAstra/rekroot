bindCardsToDetails = function() {
  $('.applicant_card').click(function (){
    $($(this)[0].dataset.target).click();
  });
}

$(document).ready(function() {
  bindCardsToDetails();
});