class Blog < ApplicationRecord
  extend Enumerize

  validates :title, presence: true, length: {maximum: 20}
  validates :content, presence: true, length: {maximum: 100}
  validates :read, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1}

  enumerize :read, in: {published: 0, unpublished: 1 }

  belongs_to :user
end
