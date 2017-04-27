class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  # include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate
    #Return true or false
    ret_val = false
    authenticate_or_request_with_http_basic do |user_name, password|
      user = User.find_by_name(user_name)
      if (!user.nil?)
        ret_val = (user_name == user.name && user.password == password)
      end
    end
    return ret_val
  end
end
