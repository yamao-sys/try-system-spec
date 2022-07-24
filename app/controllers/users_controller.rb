class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:email])

    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.id}")
    else
      render action: :new
    end
  end
end
