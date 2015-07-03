class PostsMailer < ApplicationMailer
  def notify_post_owner(comment)
    @comment  = comment
    @post     = comment.post
    mail(to: @post.user.email, subject: "Your post was commented!")
  end
end
