class EmailsController < ApplicationController

	def index
		@emails = Email.all
	end

	def create
		@email = Email.new(object: Faker::Beer.brand, body: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false))
		if @email.save
		  respond_to do |format|
		    format.html { redirect_to root_path }
		    format.js { }
		  end
		  flash[:notice] = "Email created"
		else
		  redirect_to root_path
		  flash[:notice] = "Please try again"
		end
	end

	def show
		@email = Email.find(params[:id])
		respond_to do |format|
		  format.js { }
		end
	end

end
