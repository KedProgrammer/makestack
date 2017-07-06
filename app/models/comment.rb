class Comment < ApplicationRecord
  validates :content,prescense:true, length: {maximum:140}
  belongs_to :imageable, :polymorphic => true

end
