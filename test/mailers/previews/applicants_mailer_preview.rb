# Preview all emails at http://localhost:3000/rails/mailers/applicants_mailer
class ApplicantsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/applicants_mailer/apply_to
  def apply_to
    ApplicantsMailer.apply_to
  end

  # Preview this email at http://localhost:3000/rails/mailers/applicants_mailer/applied_to
  def applied_to
    ApplicantsMailer.applied_to
  end

end
