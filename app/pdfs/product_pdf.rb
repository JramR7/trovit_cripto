class ProductPdf < Prawn::Document

    def initialize(distributor)
        @distributor = distributor 
        @products = distributor.products
        super(top_margin: 70)
        line_items
    end

    def line_items
        move_down 20 
    end

end