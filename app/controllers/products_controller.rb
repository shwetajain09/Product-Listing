class ProductsController < ApplicationController
	before_filter :load, :only => [:show,:destroy,:update,:edit]

	def load
		@product = Product.find_by_id(params[:id])
	end
	def new
		@product = Product.new
	end
	def create
		@product = Product.new(permitted_params)
		respond_to do |format|
			if @product.save
				format.html { redirect_to @product }
			else
				format.html {render :new}
			end
		end
			
	end
	def index
		@products = Product.all
	end

	def update
		respond_to do |format|
			if @product.update_attributes(permitted_params)
				format.html { redirect_to @product }
			else
				format.html {render :edit}
			end
		end
	end
	def destroy
		@product.destroy
		redirect_to products_path
	end
	
	private
	def permitted_params
		params.required(:product).permit(:name, :description, :price)
	end
end
