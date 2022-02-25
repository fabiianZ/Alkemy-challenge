require 'rails_helper'

RSpec.describe "characters", type: :request do
  
        it 'returns all characters ' do 
            get "/characters"
            expect(response).to have_http_status(:success)
            expect(response.body.size).to eq(2)
        end
        it 'create a new characters ' do 
            post "/characters", :params =>{ :character => {:image => 'https://i0.wp.com/hipertextual.com/wp-content/uploads/2020/04/hipertextual-mira-guantelete-original-iron-man-tony-stark-avengers-endgame-2020277697.jpg?fit=2048%2C1434&ssl=1', :name => 'IronMan', :age => 40, :weight => 65, :history =>'Anthony Edward Stark, conocido como Tony Stark, es un multimillonario magnate empresarial estadounidense, playboy e ingenioso científico, quien sufrió una grave lesión en el pecho durante un secuestro en el Medio Oriente. ... Él usa el traje y las versiones sucesivas para proteger al mundo como Iron Man.' }}
            expect(response.content_type).to eq("application/json; charset=utf-8")
            expect(response).to have_http_status(:success)
        end
        it 'create and delete characters ' do 
            post "/characters", :params =>{ :character => {:image => 'https://i0.wp.com/hipertextual.com/wp-content/uploads/2020/04/hipertextual-mira-guantelete-original-iron-man-tony-stark-avengers-endgame-2020277697.jpg?fit=2048%2C1434&ssl=1', :name => 'IronMan', :age => 40, :weight => 65, :history =>'Anthony Edward Stark, conocido como Tony Stark, es un multimillonario magnate empresarial estadounidense, playboy e ingenioso científico, quien sufrió una grave lesión en el pecho durante un secuestro en el Medio Oriente. ... Él usa el traje y las versiones sucesivas para proteger al mundo como Iron Man.' }}
            expect(response.content_type).to eq("application/json; charset=utf-8")

            delete "/characters/1"
            expect(response).to have_http_status(:success)
        end
        it 'it shouldnt be able to create a character without a param' do
            post '/characters', :params => {:character => {:image => 'https://i0.wp.com/hipertextual.com/wp-content/uploads/2020/04/hipertextual-mira-guantelete-original-iron-man-tony-stark-avengers-endgame-2020277697.jpg?fit=2048%2C1434&ssl=1', :name => 'Spiderman', :weight => 65, :history => 'Anthony Edward Stark, conocido como Tony Stark, es un multimillonario magnate empresarial estadounidense, playboy e ingenioso científico, quien sufrió una grave lesión en el pecho durante un secuestro en el Medio Oriente. ... Él usa el traje y las versiones sucesivas para proteger al mundo como Iron Man.'}} 
            expect(response).to have_http_status(422)           
        end
    
end
