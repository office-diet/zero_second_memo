class Memo < ApplicationRecord
  belongs_to :user
  has_many :memos_tags, dependent: :destroy
  has_many :tags, through: :memos_tags
end
