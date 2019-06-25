class ListsController < ApplicationController
	before_action :set_list, only: [:new,:edit, :update, :purpose]
	
	def new
		@list = List.new
		@user = User.find(params[:user_id])
	end


	def edit	
		@user = User.find(params[:user_id])
		@list = List.find(params[:id])		
	end	

	def create
		@list = current_user.lists.build(list_params)	
		if @list.save
			flash[:success] = "List create!"
			redirect_to user_url(current_user)
		else
			render 'new'
		end
	end

	def update
		@list = List.find(params[:id])
		if @list.update_attributes(list_params)
			flash[:success] = "List updated."
			redirect_to user_url(current_user)
		else
			render 'edit'
		end		
	end

	def destroy
		 @user = User.find(params[:id])
		 @list = List.find(params[:user_id])
		 @list.destroy
		 flash[:success] = "List deleted."
		 redirect_to user_url(current_user)
	end

	def purpose
		
		@list.home? ? @list.work! : @list.home!
		flash[:success] = "Purpose  has been changed." 
		redirect_to user_url(@user)
	end

	private

			def set_list
				@user = User.find(params[:user_id])
			end

			def list_params
				params.require(:list).permit(:text, :title, :date_due)	
			end
end
