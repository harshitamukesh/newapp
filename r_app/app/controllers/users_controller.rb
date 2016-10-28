class UsersController < ApplicationController
	def new
	# binding.pry
    @user = User.new 
     end

	def create
     @user = User.new(user_params)
     if @user.save
     redirect_to users_list_path  
 	else
 	render 'new'
 	end
	end

    def show
	@user = User.find_by_id(params[:id])
	end

	def index
     @users = User.all
    end

	def edit
	@user = User.find_by_id(params[:id])
	end

	def update
	# binding.pry
	@user = User.find_by_id(params[:id])

	@user.update_attributes(user_params)
	redirect_to users_list_path 
	end

	def destroy
	@user = user.find_by_id(params[:id])
	@user.destroy
	redirect_to users_list_path 
	end 

	def project
    @project = Project.new
	end

	def display
		@project = Project.new(project_params)
		if @project.save
			redirect_to user_displayIndex_path
		end
	end

	def displayIndex
		@project = Project.all
	end
    

private

	def user_params
	params.require(:user).permit(:firstname,:lastname,:email,:password)
	end


private

	def project_params
	params.require(:project).permit(:name,:duration,:teamsize,:cost,:domain)
	end
end


