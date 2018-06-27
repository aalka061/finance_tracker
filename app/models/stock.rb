class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks
    def self.create_from_lookup(ticker_symb)
        looked_up_stock = StockQuote::Stock.quote(ticker_symb)
        if(looked_up_stock)
            new(ticker: looked_up_stock.symbol, name: looked_up_stock.company_name, last_price: looked_up_stock.latest_price) 
        else 
            return nil
        end

    end
end
