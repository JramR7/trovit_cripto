class OffersController < ApplicationController

    def index  
        offer = Offer.all.paginate(page: params[:page],per_page: 10)
        render json:offer, status:200
    end

    def show
        offer = Offer.find(params[:id])
        render json: offer, status: 200
    end

    def create
        offer = Offer.new(params_offer)
        if offer.save
            render json: offer, status: 201
        else
            render json: offer.errors, status: :unprocessable_entity
        end
    end

    def update
        offer = Offer.find(params[:id])
        if offer.update(params_offer)
            render json: offer, status: 200
        else
            render json: offer.errors, status: 422
        end
    end

    def destroy

        offer = Offer.find(params[:id])
        offer.destroy
        respond_to do |format|
            format.json {render json: offer, status: 200}
        end
    end

    def count_offers
    
        distributor = Distributor.find(params[:distributor_id])        
        offers = Offer.countOrders(distributor.id)

        if offers
            render json: offers, status: 200
        else
            render json: offers.error , status: 201
        end

    end

    def params_offer
        params.permit(:quantity, :distributor_id, :product_id)
    end

end
