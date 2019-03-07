class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  # edits landmark
  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params['landmark'])
    redirect to "/landmarks/#{@landmark.id}"
  end

  post '/landmarks' do
    Landmark.create(params['landmark'])
    redirect '/landmarks'
  end
end
