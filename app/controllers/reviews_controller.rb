class ReviewsController < ApplicationController

  def new
    @user = current_user
    @product = Product.find(params[:product_id])
    @review = Review.new()
  end

  def create
    review_content = params['review']['content']
    id_for_join = params['review']['product_id']
    rating = params['review']['rating']
    author = params['review']['author']
    img = params['review']['image']
    @photo = Photo.new(:image => img)
    @user = current_user
    @product = Product.find(params[:product_id])
    @review = Review.new(:content => review_content, :rating => rating, :author => author)
    @review.save
    @review.photos.push(@photo)
    @product.reviews.push(@review)
    if @review.save
      flash[:notice] = "Product successfully added!"
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product)
    end
  end


end
