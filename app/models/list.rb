class List < ApplicationRecord
	belongs_to :user
	validates :user_id, presence: true
	validates :title, presence: true, length: { maximum: 100}
	validates :text, presence: true, length: { maximum: 500}
end
