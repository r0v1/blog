class PostsMailer < ApplicationMailer

  def notify_post_owner (comment)
    @comment = comment
    @user = @comment.post.user
    mail(to: @user.email, subject: "Your post was commented!")
  end
end
