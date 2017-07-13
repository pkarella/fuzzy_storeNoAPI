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
    @review = Review.new(:content => review_content, :rating => rating, :author => author, :product_id => id_for_join)
    @review.save
    @review.photos.push(@photo)
    @product.reviews.push(@review)
    if @review.save
      flash[:notice] = "Product successfully added!"
      respond_to do |f|
        f.html { redirect_to product_path(@review.product) }
        f.js
      end
    else
      redirect_to product_path(@product)
    end
  end

  def destroy
  
    @review = Review.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to product_path(@review.product) }
      format.js
    end
  end

end
