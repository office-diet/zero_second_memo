namespace :send_mail do

  desc "メール配信"

  task execute: :environment do

    users = User.all
    yesterday = Date.today - 1
    two_days_ago = yesterday - 90
    three_days_ago = two_days_ago - 180

    users.each do |user|
      yesterday_memo = Memo.where(created_at: yesterday.in_time_zone.all_day).where(user_id: user.id)
      two_days_ago_memo = Memo.where(created_at: two_days_ago.in_time_zone.all_day).where(user_id: user.id)
      three_days_ago_memo = Memo.where(created_at: three_days_ago.in_time_zone.all_day).where(user_id: user.id)
      ContactMailer.send_everyday_mail(user, yesterday_memo, two_days_ago_memo, three_days_ago_memo).deliver
    end 
  end
end
