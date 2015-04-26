class ApplicationController < ActionController::Base

  after_action :reflash
  protect_from_forgery with: :exception

  private

  def reflash
    if flash[:notice]
      flash[:success] = flash[:notice]
      flash.delete(:notice)
    elsif flash[:error]
      flash[:danger] = flash[:error]
      flash.delete(:error)
    end
  end
end
