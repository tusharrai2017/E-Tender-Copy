class Tender < ApplicationRecord
  has_many :doc2s
  has_many :doc1s
	belongs_to :user
	enum status: { draft: 0 , published: 1}
end
