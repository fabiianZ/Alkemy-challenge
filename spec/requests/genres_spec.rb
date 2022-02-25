require 'rails_helper'

RSpec.describe "Genre", type: :request do
    it 'returns all genres ' do 
        get "/genres"
        expect(response).to have_http_status(:success)
        expect(response.body.size).to eq(2)
      end
    it 'creates a new genre' do
        post '/genres', :params => { :genre => {:image => 'https://soydecine.com/wp-content/uploads/evolucion-cine-accion.jpg', :name => 'accion'}} 
    
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:success)
    end
    it 'creates and delete a new genre' do
        post '/genres', :params => { :genre => {:image => 'https://soydecine.com/wp-content/uploads/evolucion-cine-accion.jpg', :name => 'accion'}} 
        expect(response.content_type).to eq("application/json; charset=utf-8")

        delete '/genres/1'
        expect(response).to have_http_status(:success)
    end
  end
 