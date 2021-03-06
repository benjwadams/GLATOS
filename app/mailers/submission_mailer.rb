class SubmissionMailer < ActionMailer::Base

  def new_submission(submission)
    @submission = submission
    recips = @submission.user.email
    bccs = User.where("role = 'admin'").map(&:email)
    mail(:to => recips, :bcc => bccs, :subject => "[GLATOS] Data Submission Received")
  end

end
