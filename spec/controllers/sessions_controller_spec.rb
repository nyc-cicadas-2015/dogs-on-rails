require 'rails_helper'

describe SessionsController do

  describe "GET #create" do
    describe "When successful" do
      before(:each) {
        @user = create(:user)
        post :create, session: { username: user[:username], password: user[:password] }
      }
      let(:user) { attributes_for(:user) }

      it "returns http success" do
        expect(response).to redirect_to(root_path)
      end

      it "sets the session user_id variable" do
        expect(session).to have_key(:user_id)
      end

      it "sets the session user_id variable to that of the user" do
        expect(session[:user_id]).to eq @user.id
      end

      it "sets a flash message welcoming the user" do
        expect(flash[:message]).to have_content "Welcome"
      end
    end

    describe "When unsuccessful" do
      it "redirects to root" do
        post :create, session: { username: 'nil', password: 'nil' }
        expect(response).to redirect_to(root_path)
      end

      it "sets a flash error" do
        post :create, session: { username: 'nil', password: 'nil' }
        expect(flash[:error]).to have_content 'Incorrect username'
      end

      it "does not set the session user_id" do
        post :create, session: { username: 'nil', password: 'nil' }
        expect(session[:user_id]).to be_nil
      end
    end
  end

  describe "GET #destroy" do
    before(:each) {
      session[:user_id] = create(:user).id
    }

    it "unsets the session user_id" do
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it "notifies user of successful logout" do
      delete :destroy
      expect(flash[:message]).to have_content "So Long, and Thanks for all the Fish!"
    end
  end
end
