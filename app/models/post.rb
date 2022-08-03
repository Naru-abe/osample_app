class Post < ApplicationRecord
  belongs_to :end_user, optional: true
  belongs_to :tag, optional: true
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image

end
