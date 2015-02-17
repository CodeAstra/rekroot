class CustomDeviseMailer < Devise::Mailer
  protected

  def subject_for(key)
    return super  unless key.to_s == 'invitation_instructions'

    I18n.t('devise.mailer.invitation_instructions.subject', 
      :invited_by => resource.invited_by.try(:name) || 'Someone')
  end

end