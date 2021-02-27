class Blog < ApplicationRecord
  extend Enumerize

  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 100 }

  enumerize :read, in: { published: 0, unpublished: 1 }, default: 0, scope: true

  belongs_to :user
end
