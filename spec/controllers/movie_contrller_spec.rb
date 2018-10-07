require 'rails_helper'
require 'spec_helper'

RSpec.describe MoviesController, type: :controller do

    
    describe "destroy" do
      it 'destroy a movie' do
          movie = Movie.create(:title => "Titanic", :director => "James Cameron")
          delete :destroy, :id => movie.id
          expect{Movie.find(movie.id)}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
    
    describe "create" do
      it 'tests if movie is created' do
        movie = {:title => 'Star Wars', :director => 'George Lucas', :rating =>'PG', :description => 'Great Movie', :release_date => "5/25/1977"}
        post :create, movie: movie
        expect(flash[:notice]).to be_present
        expect(response).to redirect_to(movies_path)
      end
    end

   describe "index" do
     it 'test to view the index' do
	  get :index
	  expect(response).to render_template('index')
     end
   end
   
end
