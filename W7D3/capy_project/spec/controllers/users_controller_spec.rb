require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "renders the user index" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      user = User.create!(username: "Alex")
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end

  describe "POST #create" do
    let(:user_params) do
        { user: {
                username: 'Alex',
            }
        }
    end

    context "with valid params" do      
      it 'redirects to the users show page' do
        post :create, params: user_params

        alex = User.find_by(username: 'Alex')
        expect(response).to redirect_to(user_url(alex))
      end
    end

    context "with invalid params" do
      it 'validates the presence of username and renders the new template with errors' do
        post :create, params: { users: { username: '' } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end
  


end
