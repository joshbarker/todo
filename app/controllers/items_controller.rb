class ItemsController < ApplicationController
  before_action :set_item, only: [:destroy]

  def new
    @user = current_user
    @item = Item.new
  end

  def create
    @item = Item.new(item_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @item.save
        format.html { redirect_to current_user, notice: "Task #{@item.name} was successfully created."}
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
    if @item.destroy
      flash[:notice] = "Task #{@item.name} was completed."
      puts "*" * 8
      puts flash[:notice] 
    else
      flash[:error] = "Error in completing task #{@item.name}.  Please try again"
    end 
    
    respond_to do |format|
      format.html { redirect_to current_user, notice: "Task #{@item.name} was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def set_item
      @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end
  
end
