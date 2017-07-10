class Answer < ApplicationRecord
  belongs_to :imageable2, :polymorphic => true
  has_many :comments, :as => :imageable

  default_scope -> { order(created_at: :desc)}
  validates :content, presence:true, length: {minimum:10}


end
