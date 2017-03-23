class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(name: params[:product][:name], price: params[:product][:price], description: params[:product][:description], inventory: params[:product][:inventory])
    redirect_to products_path
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory.to_i > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end
end
