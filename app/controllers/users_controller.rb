class UsersController < ApplicationController
    def new
	       @user ||= ::User.new
	       render :new
    end
    def create
	    @user ||= ::User.new
	    @user.name = params[:user][:name]
	    @user.email = params[:user][:email]
	   respond_to do |format|
		  if @user.save
			 format.html {redirect_to :users}
		 	 format.js {	}
		  else
			  format.html {render :new}
			  format.js {render :errors}
		  end	
	   end
    end
    def index
	    @users = User.all
    end
    def show
	    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
	       	redirect_to :action => 'index'
    end
   def edit
	   @user = User.find(params[:id])
   end 
   def update
	   @user = User.find(params[:id])
	   @user.name = params[:user][:name]
	   @user.email = params[:user][:email]
	   @user.save
	   redirect_to @user
   end

   def destroy
	   User.delete(params[:id])
   end
end
