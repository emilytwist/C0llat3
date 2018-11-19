class Note < ApplicationRecord
	validates :content, presence: true
	validates :author, presence: true
	belongs_to :product
end
