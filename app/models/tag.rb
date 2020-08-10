class Tag < ApplicationRecord
  has_many :memos_tags
  has_many :memos, through: :memos_tags
end
