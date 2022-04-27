require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before(:example){get users_path}
    it "should return an okay reponse" do
      
      expect(response).to have_http_status(:ok)
    end
    it "should render the index template" do
     expect(response).to render_template(:index)
    end
    it "should respond with 'Here is a list of users'" do
    expect(response.body).to include('Here is a list of users')
    end 
  end
end
