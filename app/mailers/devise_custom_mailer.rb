class DeviseCustomMailer < Devise::Mailer
  helper :application
  default template_path: 'devise/mailer'
  layout 'mailer'
  helper EmailHelper
  helper ApplicationHelper
  default from: "Sam @ Tzetzes<sam@tzetzes.com>"
  
  def confirmation_instructions(record, token, opts={})
    super
  end

end
