class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_rich_text :rich_summary
  has_rich_text :rich_notes
  
  validates :title, :author, :rich_summary, :rich_notes, :rating, presence: true
  validates :rating, inclusion: { in: 0..10 }
end
