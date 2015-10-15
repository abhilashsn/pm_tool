class HappyController < ApplicationController
	def hi
		@tasks = Task.all
	end

end
