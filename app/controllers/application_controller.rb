class ApplicationController < Sinatra::Base

  set :default_content_type,'application/json'
  
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end
end
