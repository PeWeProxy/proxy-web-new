class UserOptionsController < ApplicationController
	
	def proxy_setup
	end
	
	def logs
			render 'logs/list'
	end
	
end
