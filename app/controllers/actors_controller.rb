class ActorsController < ApplicationController
	before_action :find_actor, only: [:show, :edit, :update, :destroy]

  def index
  	@actors = Actor.all.order("created_at DESC")
  end

  def new
  	@actor = Actor.new
  end

  def create
  	@actor = Actor.new(actor_params)
  	if @actor.save
  		redirect_to @actor
  	else
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update
		if @actor.update(actor_params)
			redirect_to @actor
		else
			render 'edit'
		end
  end

  def destroy
  	@actor.destroy
  	redirect_to actor_path
  end

  private

  def find_movie
  	@actor = Actor.find(params[:id])
  end

  def actor_params
  	params.require(:actor).permit(:name)
  end
end
