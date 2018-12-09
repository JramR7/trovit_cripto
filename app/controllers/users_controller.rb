require 'fb_token_api'
class UsersController < ApplicationController

    before_action :authenticate_user, only: [:show, :index]


    def index
        users = User.all.paginate(page: params[:page],per_page: 30)
        render json: users, status: 200
    end
    
    def show
        user = User.find(params[:id])
        render json: user, status: 200
    end

    def create
        user = User.new(params_user)
        
        if user.save

            if(user.userType == "distributor")
            
                distributor = Distributor.new(user_id: user.id)

                if distributor.save
                    UserCreateMailer.user_create(user).deliver
                    render json: distributor, status: 201
                else
                    render json: distributor.errors, status: :unprocessable_entity
                end

            elsif(user.userType == "businessmanager")

                business_manager = BusinessManager.new(user_id: user.id)

                if business_manager.save
                    UserCreateMailer.user_create(user).deliver
                    render json: business_manager, status: 201
                else
                    render json: business_manager.errors, status: :unprocessable_entity
                end  
            end    
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end

    def fb_create
        user = User.new(params_user)
        accessTokenJson = params.permit(:accessToken)

        accessTokenValue = accessTokenJson['accessToken']
        fb_api = FbTokenApi.new()
        token_info = fb_api.check_fb_token(accessTokenValue)['data']['is_valid']
        
        if token_info 
            if User.exists?(email: user.email)
                puts "ALREADY EXISTS"
                exists_json = {email: user.email, password: user.password}
                render json: exists_json, status: 200

            else
                if user.save

                    if(user.userType == "distributor")
                        
                        distributor = Distributor.new(user_id: user.id)
        
                        if distributor.save
                            puts "DISTRIBUTOR CREATED"
                            UserCreateMailer.user_create(user).deliver
                            create_json = {email: user.email, password: user.password}
                            render json: create_json, status: 201
                        else
                            render json: distributor.errors, status: :unprocessable_entity
                        end
        
                    elsif(user.userType == "businessmanager")
        
                        business_manager = BusinessManager.new(user_id: user.id)
        
                        if business_manager.save
                            puts "BUSINESS CREATED"
                            UserCreateMailer.user_create(user).deliver
                            create_json = {email: user.email, password: user.password}
                            render json: create_json, status: 201
                        else
                            render json: business_manager.errors, status: :unprocessable_entity
                        end  
                    end    
                else
                    render json: user.errors, status: :unprocessable_entity
                end
            end
        else
            render json: {status: "error", message: "invalid facebook token"}
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        UserDestroyMailer.user_destroy(user).deliver
        render json: user, status:200
    end

    def update
        user = User.find(params[:id])
        user.update(params_user)
        if user.update(params_user)
            render json: user, status: 200 
        else
            render json: user.errors, status: 422
        end
    end

    def getDistributors
        distributors = User.findDistributors
        render json: distributors, status: 200
    end

    def getBusinessManagers
        business_managers = User.findBusinessManagers
        render json: business_managers, status: 200
    end

    def getUserType
        user = User.find(params[:id])
        business_manager = User.findBusinessManager(user.id)
        distributor = User.findDistributor(user.id)
        if business_manager.empty?
            render json: distributor, status: 200
        else 
            render json: business_manager, status: 200
        end
    end

    def getPictures
        
        user = User.find(params[:id])
        pictures = User.findPictures(user.id)

        render json: pictures , status: 200
    
    end

    def count_types
        
        user = User.countTypes()

        if user
            render json: user, status: 200
        else
            render json: user.error, status: 201
        end
    
    end


    def params_user
        params.require(:user).permit(:name, :location, :userType, :phone, :email, :password)
    end

end