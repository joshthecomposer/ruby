class UsersController < ApplicationController
  def new
    @user = User.new
    @errors = flash[:errors]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    if current_user && current_user.id.to_s == params[:id]
      @user = User.find(params[:id])
      @pokemon = get_pokemon_data
    else
      session.delete(:user_id)
      @current_user = nil
      redirect_to new_session_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def get_pokemon_data()
    url = "https://pokeapi.co/api/v2/pokemon/"+rand(1..1000).to_s
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    return parsed
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
