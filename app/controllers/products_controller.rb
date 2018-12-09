class ProductsController < ApplicationController

    def index
        distributor = Distributor.find(params[:distributor_id])
        if distributor 
            products = distributor.products
            render json:products , status: 200
        end
    end

    def show
        distributor = Distributor.find(params[:distributor_id])
        product = distributor.products.find(params[:id])
            render json: product, status:200
    end

    def create
        distributor = Distributor.find(params[:distributor_id])
        product = distributor.products.new(params_product)
        user = User.find(distributor.user_id)
        if product.save 
            ProductMailer.product_creation(user, product).deliver
            render json: product, status:201
        else
            render json: product.errors, status: :unprocessable_entity
        end
    end


    def destroy
        distributor = Distributor.find(params[:distributor_id])
        product = distributor.products.find(params[:id])
        product.destroy
            render json: product, status: 200
    end

    def update
        distributor = Distributor.find(params[:distributor_id])
        product = distributor.products.find(params[:id])
        if product.update(params_product)
            render json: product, status: 200
        else
            render json: product.errors, status: 422
        end

    end

    #Method to Creat Distributor Pictures

    def createPicture

        product = Product.find(params[:id])
        picture = product.pictures.new(params_picture)
        if picture.save 
            render json: picture, status:201
        else
            render json: picture.errors, status: :unprocessable_entity
        end
    end

    def showPictures
        
        product = Product.find(params[:id])
        if product
            pictures = user.pictures
            render json: pictures , status: 200
        end

    end

    def params_product
        params.permit(:price, :producType, :brand, :productName,:quantity,:description)
    end


    def count_products
        products = Product.countProducts()
        if products
            render json: products , status: 200
        else
            rednder json: products.error , status:  201
        end
    end

    def find_highest
        
        distributor = Distributor.find(params[:distributor_id]) 
        product = Product.findHighest(distributor.id)
        if product
            render json: product , status: 200
        else
            rednder json: product.error , status:  201
        end
    
    end

    def find_lowest
        
        distributor = Distributor.find(params[:distributor_id])
        product = Product.findLowest(distributor.id)
        if product 
            render json: product , status: 200
        else
            render json: product.error, status: 201
        end 
    end

    def averages
        products = Product.averages()
        if products
            render json: products , status: 200
        else
            rednder json: products.error , status:  201
        end
    end

    def count_orders
        orders = Product.countOrders()
        if orders
            render json: orders, status: 200
        else
            render json: orders.error, status: 201
        end
    end

    def count_offers
        
        offers = Product.countOffers()
        if offers
            render json: offers, status: 200
        else
            render json: offers.error, status: 201
        end
    
    end


    # Add picture parameters

    def params_picture
       # params.permit(:image,:pictureType,:pictureUrl)
        params.permit(:image,:imageName)
    end

end
