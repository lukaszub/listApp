class ListsController < ApplicationController
	before_action :logged_in_user

	def new
		@list = List.new	
	end

	def create
		@list = current_user.lists.build(list_params)

		if @list.save
		flash[:success] = "New list has been created!"
		redirect_to current_user
		else
			render 'new'
		end
	end		

	private

			def list_params
				params.require(:list).permit(:title,:text,:date_due)	
			end
	
end
