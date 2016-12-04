require "rails_helper"

RSpec.describe ProductsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the products into @products" do
      product1, product2 = Product.create(:name => "product1",:description => "A great product to have", :price => 400), Product.create(:name => "product2",:description => "A great product to have", :price => 800)
      get :index
      expect(assigns(:products)).to match_array([product1, product2])
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates the product' do
        Product.create(:name => "product1",:description => "A great product to have", :price => 400)
        expect(Product.count).to eq(1)
      end

      it 'redirects to the "show" action for the product' do
        product = Product.create(:name => "product1",:description => "A great product to have", :price => 400)
        get :show, id: product
        expect(response).to render_template("show")
      end
    end

    context 'with invalid attributes' do
      it 'does not create the product' do
        Product.create(:name => "product1")
        expect(Product.count).to eq(0)
      end
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      Product.create(:name => "product1",:description => "A great product to have", :price => 400)
      product = Product.first
      get :show, id: product
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it 'redirects to the "show" action for the new product' do
        product = Product.create(:name => "product1",:description => "A great product to have", :price => 400)
        get :show, id: product
        expect(response).to render_template("show")
    end
  end

  describe "GET #edit" do
    it "responds successfully with an HTTP 200 status code" do
      Product.create(:name => "product1",:description => "A great product to have", :price => 400)
      product = Product.first
      get :show, id: product
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it 'redirects to the "show" action for the new product' do
        product = Product.create(:name => "product1",:description => "A great product to have", :price => 400)
        get :show, id: product
        expect(response).to render_template("show")
    end
  end

  describe 'DELETE destroy' do
    before :each do
        @product = Product.create(:name => "product1",:description => "A great product to have", :price => 400)
    end
    
    it "deletes the product" do
      expect{
        delete :destroy, id: @product        
      }.to change(Product,:count).by(-1)
    end
      
    it "redirects to products#index" do
      delete :destroy, id: @product
      expect(response).to redirect_to products_url
    end
  end

end