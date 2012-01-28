class SetCookieController < ApplicationController
	def cookie
		@back = request.referer;
	end
end
