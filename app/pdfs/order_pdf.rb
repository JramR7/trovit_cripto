class OrderPdf < Prawn::Document

    def initialize(order, product)
        @order = order 
        @product = product
        super(top_margin: 70)
        order_number 
        line_items
    end

    def order_number
        text "Order \##{@order.id}", size: 25, style: :bold
    end

    def line_items
        move_down 20
        text "Product: #{@product.productName}"
        text "Quantity: #{@order.quantity}"
        text "Unit Price: #{@product.price}"
        text "Full Price: #{@product.price * @order.quantity}"
    end


end