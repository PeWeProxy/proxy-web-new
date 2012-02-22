class ApplicationController < ActionController::Base
  protect_from_forgery
	
	before_filter :set_variables, :set_locale
	
	def set_variables
		@uid = get_uid_from_cookie
		@uid_new = generate_uid
	end

  def set_locale
    I18n.locale = params[:locale] || :sk
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end

	def generate_uid
		UUIDTools::UUID.random_create.to_s.gsub(/-/, '')
  end
	
	def get_uid_from_cookie
    cookie_val = request.cookies["__peweproxy_uid"]
    return cookie_val && cookie_val != '' ? cookie_val : nil
  end
	
end
