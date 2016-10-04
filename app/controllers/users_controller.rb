class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    # first_name = params[:first_name]
    # last_name = params[:last_name]
    # username = params[:username]
    # email = params[:email]
    # newsletter = params[:newsletter]
    # password = params[:password]
    # all_params = [ first_name, last_name, username, email, newsletter, password ]
    # unless params.any? { |x| x.nil? }
    # else
    #   render :'devise/registrations/new'
    # end
    #
  end
end
