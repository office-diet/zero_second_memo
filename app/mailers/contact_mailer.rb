class ContactMailer < ApplicationMailer
  def send_everyday_mail(user, yesterday_memo, two_days_ago_memo, three_days_ago_memo) 
    @user = user
    @yesterday_memo = yesterday_memo
    @two_days_ago_memo = two_days_ago_memo
    @three_days_ago_memo = three_days_ago_memo
    mail to: @user.email, subject: '0秒メモアプリ配信'
  end
end
