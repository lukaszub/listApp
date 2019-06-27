class List < ApplicationRecord
	enum purpose: [:home, :work]
	belongs_to :user
	validates :user_id, presence: true
	validates :title, presence: true, length: { maximum: 100}
	validates :text, presence: true, length: { maximum: 500}

	def self.my_order
		order(created_at: :desc)			
	end
	
end
