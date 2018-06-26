class StocksController < ApplicationController

    def search
        if params[:stock].present?
            @stock=Stock.create_from_lookup(params[:stock])
            if @stock
                respond_to do |format|
                    format.js {render partial: 'users/result'}
                end
            else
                flash.now[:danger] = "You have entered non-existant symbol"
                render partial: 'users/result'

            end
        else 
            flash.now[:danger] = "You have entered on empty string"
            render partial: 'users/result'
        end
    end

end 
