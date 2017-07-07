class Answer < ApplicationRecord
  default_scope -> { order(created_at: :desc)}
  validates :content, presence:true, length: {maximum:100}
  belongs_to :imageable2, :polymorphic => true
end
