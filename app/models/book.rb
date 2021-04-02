class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :title, :author, :summary, :notes, :rating, presence: true
  validates :rating, inclusion: { in: 0..10 }
end
