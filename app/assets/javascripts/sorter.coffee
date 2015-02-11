@Sorter =
  makeSortable: (company_id, job_id) ->
    $('.dashboard_column_list').sortable
      connectWith: ".dashboard_column_list"
      placeholder: "ui-state-highlight"
      update: ->
        $.ajax
          url: "/companies/#{company_id}/jobs/#{job_id}/sort_applicants"
          data:
            applicant_ids: Sorter.serializeCards()
          type: 'PUT'
  serializeCards: ->
    applicant_divs = $('#applied_applicants .applicant')
    card_ids = []
    for applicant in applicant_divs
      card_ids.push(applicant.id.split("_")[1])
    card_ids