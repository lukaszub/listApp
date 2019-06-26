class ListsController < ApplicationController
	before_action :set_list, only: [:new,:edit, :create, :update, :purpose, :work, :home]
	
	def new
		@list = current_user.lists.build
	end

	def work
		@list = @user.lists.work	
	end

	def home
		@list = @user.lists.home	
	end

	def edit	
		@user = User.find(params[:user_id])
		@list = List.find(params[:id])		
	end	

	def create
		@list = @user.lists.build(list_params)	
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
		 @list = List.find(params[:id])
		 @list.destroy
		 flash[:success] = "List deleted."
		 redirect_to user_url(current_user)
	end

	def purpose
		@list = List.find(params[:id])	
		@list.home? ? @list.work! : @list.home!
		flash[:success] = "Purpose  has been changed." 
		redirect_to user_url(@user)
	end

	private

			def set_list
				@user = User.find(params[:user_id])
			end

			def list_params
				params.require(:list).permit(:text, :title, :date_due, :purpose)	
			end
end
