class WelcomeController < ApplicationController
	def home
		render html: '<h1> welcome home controller </h1>'.html_safe
	end

end