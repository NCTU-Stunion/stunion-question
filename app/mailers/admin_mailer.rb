class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.reply.subject
  #

  def reply(comment)
    @comment = comment
    @post = comment.post
    mail(from: ENV['email'], to: @post.email, subject: @post.email_subject)
  end

end
