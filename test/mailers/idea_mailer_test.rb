require "test_helper"

class IdeaMailerTest < ActionMailer::TestCase
  test "idea_created" do
    mail = IdeaMailer.idea_created
    assert_equal "Idea created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
