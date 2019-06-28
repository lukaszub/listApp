class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:edit, :update]
  before_action :correct_user,   only: [:show, :edit, :update]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
 
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(@user.id) 
    redirect_to(root_url) if @user.nil?
    @list = @user.lists
    @list_work = @user.lists.work.my_order
    @list_home = @user.lists.home  
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
      log_in @user
      flash[:success] = "Welcome to ListApp!"
      redirect_back_or @user 
  	else
  		render 'new'
  	end	
  end

  def edit
    @user = User.find(params[:id])  
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  		 def user_params
  		  params.require(:user).permit(:name, :email, :password,
  										 :password_confirmation)	
       end

       def correct_user
        @user = User.find(params[:id])  
        unless current_user?(@user)
          flash[:info] = "Trying access wrong user"  
          redirect_to(root_url)  
        end
       end

       def handle_record_not_found
        flash[:danger] = "Access denyied"
        redirect_to (root_url)    
      end

end
