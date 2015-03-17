class PatientsController < ApplicationController
  def subscriber_params
    params.require(:subscriber).permit(:region, :referrer, :signup_date, :discount, user_attributes: [ :id, :email, :username, :password ])
  end
end
