class ApplicantsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.applicants_mailer.apply_to.subject
  #
  def apply_to(applicant)
    @applicant = applicant
    mail to: @applicant.email, subject: "Email Id Confirmation"
  end

  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.applicants_mailer.applied_to.subject
  #
  def applied_to
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
