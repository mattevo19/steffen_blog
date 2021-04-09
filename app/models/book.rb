class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_rich_text :rich_summary
  
  validates :title, :author, :summary, :rich_summary, :notes, :rating, presence: true
  validates :rating, inclusion: { in: 0..10 }
end
