class StoreController < ApplicationController
  def index
	@products = Product.find_products_for_sale
  end

	def find_cart
		unless session[:cart]
			session[:cart] = Cart.new
		end
		session[:cart]
	end

	def add_to_cart
		product = Product.find(params[:id])
		@cart = find_cart
		@cart.add_product(product)

		rescue ActiveRecord::RecordNotFound
			logger.error("Attempt to access invalid product #{params[:id]}")
			flash[:notice] = "Invalid product"
			redirect_to :action => 'index'
	end

	def empty_cart
		reset_session
		session[:cart] = nil
		redirect_to :action => 'index'
	end

end
