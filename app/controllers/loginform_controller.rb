class LoginformController < ApplicationController
  def new
    respond_to do |format|
      format.js {render 'devise/sessions/login_form' }
    end
  end
end
