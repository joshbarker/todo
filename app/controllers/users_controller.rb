class UsersController < ApplicationController
   before_action :authenticate_user!
 
    def show
      @user = User.find(params[:id])
      ### @lists = @user.lists.paginate(page: params[:page], per_page: 10)
      #@items = @user.items
     end 

   def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to edit_user_registration_path(current_user)
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end
 
   private
 
   def user_params
     params.require(:user).permit(:name)
   end
  
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  # def index
  #   @users = User.all
  # end

  # def show
  #   @lists = @user.lists
  # end

  # def new
  #   @user = User.new
  # end

  # def edit
  # end

  # def create
  #   @user = User.new(user_params)

  #   if @user.save
  #     redirect_to @user, notice: 'User was successfully created.'
  #   else
  #     render action: 'new'
  #   end
  # end

  # def update
  #   if @user.update(user_params)
  #     redirect_to @user, notice: 'User was successfully updated.'
  #   else
  #     render action: 'edit'
  #   end
  # end

  # def destroy
  #   @user.destroy
  #   redirect_to @user_url
  # end

  # private

  # def set_user
  #   @user = User.find(params[:id])
  # end

  # def user_params
  #   params.require(:user).permit(:username, :password,)
  # end
end
