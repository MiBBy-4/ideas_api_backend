class IdeaMailer < ApplicationMailer
  INVESTOR_ROLE = 1

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.idea_mailer.idea_created.subject
  #
  def idea_created
    @idea = params[:idea]
    @idea_link = "#{ENV['IDEA_LINK']}" + @idea.id.to_s

    mail(
      cc: Customer.where("role = :role", role: INVESTOR_ROLE).pluck(:email),
      subject: "New Idea created",
    )
  end
end
