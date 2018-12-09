class CompaniesController < ApplicationController
    def index
        companies = Company.all
        render json: companies, status: 200
    end
    
    def show
        company = Company.find(params[:id])
        
        respond_to do |format|
            format.json {render json: company, status: 200}
            format.pdf do
                pdf = CompanyPdf.new(company)
                send_data pdf.render, filename: 'company.pdf', type: 'application/pdf',disposition: "inline"
            end
        end
    end

    def create
        company = Company.new(params_company)
        if company.save
            render json: company, status: 201
        else
            render json: company.errors, status: :unprocessable_entity
        end
    end

    def destroy
        company = Company.find(params[:id])
        company.destroy
        render json: company, status:200
    end

    def update
        company = Company.find(params[:id])
        company.update(params_company)
        if company.update(params_company)
            render json: company, status: 200
        else
            render json: company.errors, status: 422
        end
    end

    def employees
        company = Company.find(params[:id])
        employees = Company.showEmployees(company.id)
        render json: employees, status:200
    end

    def params_company
        params.permit(:name, :location, :companyType)
    end
end
