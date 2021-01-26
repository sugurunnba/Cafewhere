class ContactMailer < ApplicationMailer
  # お問い合わせ内容の宛先、タイトルを設定
  def contact_mail(contact)
    @contact = contact
    mail to: 'sugurunnba7@gmail.com,', subject: 'お問い合わせ内容'
  end
end
