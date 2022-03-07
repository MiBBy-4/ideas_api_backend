# Preview all emails at http://localhost:3000/rails/mailers/idea_mailer
class IdeaMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/idea_mailer/idea_created
  def idea_created
    IdeaMailer.with(user: User.first, idea: Idea.first).idea_created
  end

end
