class UserStocksController < ApplicationController
    def create
        stock = Stock.find_by_ticker(params[:stock_ticker])
        if stock.blank?
            stock = Stock.create_from_lookup(params[:stock_ticker])
            stock.save
        end
        @user_stock = UserStock.create(user: current_user, stock: stock)
        flash[:success] = "Sotck #{stock.name} was successfuly added"
        redirect_to my_portfolio_path
    end
end
