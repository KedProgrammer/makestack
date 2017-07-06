class Question < ApplicationRecord
  validates :tittle, presence:true, length: {maximum:50}
  validates :content,presence:true, length: {minimum:20}
  has_many :comments, :as => :imageable
  has_many :answers, :as => :imageable
  belongs_to :user

end
