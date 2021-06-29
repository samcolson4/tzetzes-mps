class TestMailer < ActionMailer::Base
  default from: "Sam <sam@tzetzes.com>"
  default template_path: 'layouts/'
  layout 'mailer'
  
  def mailer(email)
    @email = email
    mail(to: @email, subject: 'Test Send')
  end

 end
