var Sorter = {
  makeSortable: function(company_id, job_id) {
    $('.dashboard_column_list').sortable({
      connectWith: ".dashboard_column_list",
      placeholder: "ui-state-highlight",
      update: function() {
        $.ajax({
          url: "/companies/" + company_id + "/jobs/" + job_id + "/sort_applicants",
          data: {
            applicant_ids: Sorter.serializeCards()
          },
          type: 'PUT'
        })
      }
    });
  },
  serializeCards: function() {
    var applicant_divs = $('#applied_applicants .applicant')
    var card_ids = []
    for(var i = 0; i < applicant_divs.length; i++) {
      card_ids.push(applicant_divs[i].id.split("_")[1]);
    }

    return card_ids;
  }
}

