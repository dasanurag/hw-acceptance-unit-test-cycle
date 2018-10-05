require 'rails_helper'
require 'spec_helper'

RSpec.describe MoviesController, type: :controller do
    
    it 'destroy a movie' do
        movie = Movie.create(:title => "Titanic", :director => "James Cameron")
        delete :destroy, :id => movie.id
        expect{Movie.find(movie.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
    
    it 'tests creation of a movie' do
        post :create, :movie => { :title => "T", :director => "D", :rating => "R", :release_date =>"09/09/2010"}
        expect(flash[:notice]).to be_present
        expect(response).to redirect_to(movies_path)
    end
    
   it 'should view the index' do
	get :index
	expect(response).to render_template('index')
   end

   it 

end
