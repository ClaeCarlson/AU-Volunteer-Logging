class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  def current_user
    
    respond_to do |format|
      if current_admin
        format.json {render json: current_admin }
      else 
        format.json {render json: current_volunteer}
      end
    end
  end
end
