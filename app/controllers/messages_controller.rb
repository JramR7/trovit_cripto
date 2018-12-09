class MessagesController < ApplicationController

    def index
        messages = Message.all.paginate(page: params[:page],per_page: 10)
        render json: messages, status: 200
    end

    def show
        message = Message.find(params[:id])
        render json: message, status: 200
    end

    def create
        message = Message.new(params_message)
        if message.save
            render json:message, status: 201
        else
            render json:message.errors, status: :unprocessable_entity
        end
    end

    def update
        message = Product.find(params[:id])
        if message.update(params_product)
            render json: message, status: 200
        else
            render json: message.errors, status: 422
        end
    end

    def destroy

        message = Product.find(params[:id])
        message.destroy
        render json: message, status: 200

    end

    def offers

        message = Message.find(params[:id])
        offers = Message.findOffers(message.id)
        render json: offers , status: 200

    end

    def orders

        message = Message.find(params[:id])
        orders = Message.findOrders(message.id)
        render json: orders , status: 200

    end

    def params_message
        params.permit(:message, :distributor_id, :business_manager_id)
    end
end
