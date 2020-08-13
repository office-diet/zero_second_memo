class ContactMailer < ApplicationMailer
  def send_when_admin_reply(user, memos) #メソッドに対して引数を設定
    @user = user #ユーザー情報
    @memo = memos.last #返信内容
    mail to: @user.email, subject: '【サイト名】 お問い合わせありがとうございます'
  end
end
