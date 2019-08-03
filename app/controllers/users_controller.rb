class UsersController < ApplicationController
    before_action :check_status, except: [:index, :create, :login, :logout]

    def index

    end

    def create
        user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city: params[:city], state: params[:state], password: params[:password], password_confirmation: params[:password_confirmation])
        if user.valid?
            session[:user_id] = user.id
            redirect_to '/show'
        else
            flash[:errors] = user.errors.full_messages.to_sentence
            # render json: user.errors
            # redirect_to ('/show/' + user.id.to_s)
            redirect_to '/'
        end
    end

    def login
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to '/show'
        else
            flash[:message] = "Something was wrong with login credentials"
            redirect_to '/'
        end
        # redirect_to '/'
    end

    def show
        @users = User.all
        # render json: params
    end

    def info

        @user = User.find(params[:id])
    end

    def edit

        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city: params[:city], state: params[:state])
            redirect_to '/show'
        else
            flash[:note] = "Password and Password Confirmation need to match"
            redirect_to ('/edit/'+ @user.id.to_s)
        end
    end

    def detail
        @user = User.find(params[:id])
    end

    def logout
        session[:user_id] = nil
        redirect_to '/'
    end

    private

    def check_status
        if !session[:user_id]
            redirect_to '/'
        end
    end


end
