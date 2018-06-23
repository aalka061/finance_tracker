class StocksController < ApplicationController

    def search
        if params[:stock].present?
            @stock=Stock.create_from_lookup(params[:stock])
            if @stock
                respond_to do |format|
                    format.js {render partial: 'users/result'}
                end
            else
                flash[:danger] = "You have entered non-exitant symbol"
                redirect_to my_portfolio_path

            end
        else 
            flash[:danger] = "You have entered on empty string"
            redirect_to my_portfolio_path
        end
    end

end 
