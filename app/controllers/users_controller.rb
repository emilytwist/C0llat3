class UsersController < ApplicationController
	load_and_authorize_resource

  def index
  	@users = User.all
  end

  def show
    if current_user.eltek?
      @user = User.find(params[:id])
    else
      redirect_to root_url, notice: "You are not authorised to view this page."
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if current_user.eltek?
      @user = User.find(params[:id])
      @user.destroy

      if @user.destroy
          redirect_to users_path, notice: "User deleted."
      end

    else
      redirect_to root_url, notice: "You are not authorised to do this."
    end
  end

  private

def user_params
  params.require(:user).permit(:eltek, :distributor)
 end 




end
