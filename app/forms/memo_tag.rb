class MemoTag

  include ActiveModel::Model
  attr_accessor :theme, :text, :user_id, :tags

  with_options presence: true do
    validates :theme, :text, :user_id
    validates :theme, length: { maximum: 20 } 
  end

  def save
    memo = Memo.create(theme: theme, text: text, user_id:  user_id)
    if tags != nil
      tags.each do |t|
        tag = Tag.where(name: t).first_or_initialize
        tag.save
        MemosTag.create(memo_id: memo.id, tag_id: tag.id)
      end
    end
  end

end