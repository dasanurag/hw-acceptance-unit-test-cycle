require 'rails_helper'

describe MoviesController do

  describe 'POST #create' do
    it 'creates a new movie' do
      expect {post :create, movie: FactoryGirl.attributes_for(:movie)
      }.to change { Movie.count }.by(1)   	
    end

    
    it 'redirects to the movie index page' do
      post :create, movie: FactoryGirl.attributes_for(:movie)
      expect(response).to redirect_to(movies_url)
    end



  end






end
