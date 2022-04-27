require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /users/:user_id/posts" do
    before(:example) do
      get user_posts_path(user_id:1)
    end
    it "works! (now write some real specs)" do
      expect(response).to have_http_status(200)
    end
    it "should render the index template" do
     expect(response).to render_template(:index)
    end
    it "should respond with 'Here is a list of posts for a given user'" do
    expect(response.body).to include('Here is a list of posts for a given user')
    end 
  end
    describe "GET /users/:user_id/posts/:id" do
      before(:example){get user_post_path(user_id:1,id:1)}
      it "should return an okay reponse" do
        
        expect(response).to have_http_status(:ok)
      end
      it "should render the show template" do
       expect(response).to render_template(:show)
      end
      it "should respond with 'Here is a single post'" do
      expect(response.body).to include('Here is a single post')
      end 
    end
end
