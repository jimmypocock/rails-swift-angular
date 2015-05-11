class UsersController < ApplicationController
  # respond_to :json

  #GET /users
  def index
    if users = User.all
      render :json => {success: true, users: User.all}
    else
      render :json => {success: false}
    end
  end

  #GET /users/:id
  def show
    if user = (::User.find(params[:id]) rescue nil)
      render :json => {success: true, user: user}
    else
      render :json => {success: false}
    end
  end

  #POST /users
  def create
    if(user = User.new(user_params).save!)
      render :json => {success: true, user: user}
    else
      render :json => {success: false}
    end
  end

  #PUT /users/:id
  def update
    if (user = (::User.find(params[:id]) rescue nil))
      user.update_attributes(user_params)
      render :json => {success: true, user: user}
    else
      render :json => {success: false}
    end

  end

  #DELETE /api/v1/users/:id
  def destroy
    if (user = ::User.find(params[:id]))
      user.destroy
      render :json => {success: true}
    else
      render :json => {success: false}
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :bio)
  end

end
