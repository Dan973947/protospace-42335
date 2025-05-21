class Comment < ApplicationRecord
  #ここからアソシエーション
  belongs_to :user
  belongs_to :prototype

  #ここからバリデーション
  validates :content, presence: true
end
