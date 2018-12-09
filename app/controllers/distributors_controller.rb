class DistributorsController < ApplicationController


    before_action :authenticate_user, only: [:show, :index]


    def index
        distributors = Distributor.all.paginate(page: params[:page],per_page: 10)
        #distributors = distributor.selectFive();
        render json: distributors, status: 200
    end
    
    def show
        distributor = Distributor.find(params[:id])
        render json: distributor, status: 200
    end


    def destroy
        distributor = Distributor.find(params[:id])
        distributor.destroy
        render json: distributor, status:200
    end

    def update
        distributor = Distributor.find(params[:id])
        distributor.update(params_distributor)
        if distributor.update(params_distributor)
            render json: distributor, status: 200 
        else
            render json: distributor.errors, status: 422
        end
    end

    def getInfo
        distributor = Distributor.find(params[:id])
        info = Distributor.userInfo(distributor.user_id)
        render json: info, status: 200
    end

    def getMessages
        distributor = Distributor.find(params[:id])
        messages = Distributor.findMessages(distributor.id)
        render json: messages, status: 200
    end

    #Method to Creat Distributor Pictures

    def createPicture

        distributor = Distributor.find(params[:id])
        user = User.find(distributor.user_id)
        picture = user.pictures.new(params_picture)
        if picture.save 
            render json: picture, status:201
        else
            render json: picture.errors, status: :unprocessable_entity
        end
    end

    def listMessages

        distributor = Distributor.find(params[:id])
        messages = distributor.messages

        if messages
            render json: messages, status: 200
        else
            render json: messages.error, status: 201
        end

    end


    def showPictures
        
        distributor = Distributor.find(params[:id])
        user = User.find(distributor.user_id)
        if user 
            pictures = user.pictures
            render json:pictures , status: 200
        end
        
    end
    
    def params_distributor
        params.require(:distributor).permit(:user_id)
    end

    #Add Picture Parameters

    def params_picture
        params.permit(:image,:pictureType,:pictureUrl)
    end

end
