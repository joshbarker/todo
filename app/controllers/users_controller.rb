class UsersController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items.sorted
    @item = Item.new
  end 

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
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
  
end
