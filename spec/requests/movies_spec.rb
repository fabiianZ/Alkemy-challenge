require 'rails_helper'

RSpec.describe "Movies", type: :request do
  it 'returns all movies ' do 
    get "/movies"
    expect(response).to have_http_status(:success)
    expect(response.body.size).to eq(2)
  end

  it 'creates a new movie' do

    post '/genres', :params => { :genre => {:image => 'https://soydecine.com/wp-content/uploads/evolucion-cine-accion.jpg', :name => 'accion'}} 
    expect(response.content_type).to eq("application/json; charset=utf-8")

    post '/movies', :params => { :movie => {:image => 'https://pics.filmaffinity.com/Venom-824559573-large.jpg', :title => 'venom', :creation_date => '2002/12/02', :qualification => 4, :genre_id => 1 }} 

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:success)
 end
 it 'creates and delete a new movie' do

    post '/genres', :params => { :genre => {:image => 'https://soydecine.com/wp-content/uploads/evolucion-cine-accion.jpg', :name => 'accion'}}
    expect(response.content_type).to eq("application/json; charset=utf-8")

    post '/movies', :params => { :movie => {:image => 'https://pics.filmaffinity.com/Venom-824559573-large.jpg', :title => 'venom', :creation_date => '2002/12/02', :qualification => 4, :genre_id => 1 }}
    expect(response.content_type).to eq("application/json; charset=utf-8")

    delete '/movies/1'
    expect(response).to have_http_status(:success)
end
  it 'cant create a movie' do
    post '/genres', :params => { :genre => {:image => 'https://soydecine.com/wp-content/uploads/evolucion-cine-accion.jpg', :name => 'accion'}} 
    expect(response.content_type).to eq("application/json; charset=utf-8")

    post '/movies', :params => { :movie => {:image => 'https://pics.filmaffinity.com/Venom-824559573-large.jpg', :title => 'venom', :creation_date => '2002/12/02', :qualification => 4, :genre_id => 2 }} 
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(422)
 end
end

