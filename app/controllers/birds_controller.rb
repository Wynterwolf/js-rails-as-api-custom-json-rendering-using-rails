class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    # render json: @birds
    
    #  or cut show items here with only:
    # render json: @birds, only: [:id, :name, :species]

    #or except
    render json: @birds, except: [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    
    # all the details below
    # render json: bird
    
    # some of the details below
    if bird
      render json: {id: bird.id, name: bird.name, species: bird.species } 
    else
      render json: {message: 'Bird not found'} #error message

    #built in slice
    # render json: bird.slice(:id, :name, :species)


  end
end