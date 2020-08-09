class Tag < ApplicationRecord
  has_many :memos_tags
  has_many :memos, through: :memos_tags

  validates :tag, presence: true
end
