class CompanyPdf < Prawn::Document

    def initialize(company)
        @company = company
        super(top_margin: 70)
        name 
        line_items
    end

    def name
        text "#{@company.name}", size: 20, style: :bold
    end

    def line_items
        move_down 50
        text "Location: #{@company.location}", size: 12
        move_down 15
        text "Type: #{@company.companyType}", size: 12
    end


end