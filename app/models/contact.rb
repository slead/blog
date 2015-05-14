class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => true
  attribute :message,   :validate => true
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "Contact Form",
      :to => "stephen.lead@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end