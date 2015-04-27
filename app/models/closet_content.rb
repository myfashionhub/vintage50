class ClosetContent < ActiveRecord::Base
	belongs_to :user
	belongs_to :product

	def create
	end

	def destroy
	end
end
