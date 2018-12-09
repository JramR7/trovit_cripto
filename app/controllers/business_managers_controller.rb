class BusinessManagersController < ApplicationController

    before_action :authenticate_user, only: [:show, :index]

    def index
        business_managers = BusinessManager.all.paginate(page: params[:page],per_page: 10)
        #business_managers = business_manager.selectFive();
        render json: business_managers, status: 200
    end
  
    def show
        business_manager = BusinessManager.find(params[:id])
        render json: business_manager, status: 200
    end

    def create

        user = User.find(params[:user_id])
        company = Company.last 
        business_manager = BusinessManager.new(user_id: user.id, company_id: company.id)

        if business_manager.save
            render json: business_manager, status: 201
        else
            render json: business_manager.errors, status: :unprocessable_entity 
        end
    end

    def destroy
        business_manager = BusinessManager.find(params[:id])
        business_manager.destroy
        render json: business_manager, status:200
    end

    def update
        business_manager = BusinessManager.find(params[:id])
        business_manager.update(params_business_manager)
        if business_manager.update(params_business_manager)
            render json: business_manager, status: 200 
        else
            render json: business_manager.errors, status: 422
        end
    end

    def getMessages
    
    businessManager = BusinessManager.find(params[:id])
    messages = BusinessManager.findMessages(businessManager.id)

    render json: messages, status: 200


end

#Method to Creat Bussiness Manager Pictures

def createPicture

    businessManager = BusinessManager.find(params[:id])
    user = User.find(businessManager.user_id)
    picture = user.pictures.new(params_picture)
    if picture.save 
        render json: picture, status:201
    else
        render json: picture.errors, status: :unprocessable_entity
    end
end

def showPictures        
    businessManager = BusinessManager.find(params[:id])
    user = User.find(businessManager.user_id)
        if user 
            pictures = user.pictures
            render json:pictures , status: 200
        end
end


def listMessages

    business_manager = BusinessManager.find(params[:id])
    messages = business_manager.messages

    if messages
        render json: messages, status: 200
    else
        render json: messages.error, status: 201
    end

end

def params_business_manager
    params.require(:business_manager).permit(:user_id, :company_id)
end

#Add Picture Parameters 
def params_picture
    params.permit(:image,:pictureType,:pictureUrl)
end

    def params_business_manager
        params.require(:business_manager).permit(:user_id, :company_id)
    end
end
