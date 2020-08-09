class Memo < ApplicationRecord
  belongs_to :user
  has_many :memos_tags
  has_many :tags, through: :memos_tags

  with_options presence: true do
    validates :theme, :text
    validates :theme, length: { maximum: 20 } 
  end
end
