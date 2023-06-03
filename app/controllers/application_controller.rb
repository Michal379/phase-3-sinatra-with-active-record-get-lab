class ApplicationController < Sinatra::Base

  set :default_content_type,'application/json'

  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    # find the bakery with the specified ID
    bakery = Bakery.find(params[:id])
    # include the nested baked goods in the response
    bakery_with_goods = bakery.as_json(include: :baked_goods)
    # send the bakery with nested goods as JSON
    bakery_with_goods.to_json
  end

  get '/baked_goods/by_price' do
    # get all the baked goods from the database and sort by price in descending order
    baked_goods = BakedGood.order(price: :desc)
    # send the sorted baked goods as JSON
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    # find the most expensive baked good in the database
    most_expensive_good = BakedGood.order(price: :desc).first
    # send the most expensive baked good as JSON
    most_expensive_good.to_json
  end
end
