class Comment < ApplicationRecord

  belongs_to :imageable, :polymorphic => true
  validates :content, presence:true, length: {minimum:5}

end
