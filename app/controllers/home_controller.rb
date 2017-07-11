class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all

    # @books = JSON.parse(RestClient::Request.execute(method: :get, url: 'https://api.nytimes.com/svc/books/v3/lists/combined-print-and-e-book-fiction.json', headers: {api_key:  '3930eed521a2437c957c7768a7b5969e'}))

  end

  
end
