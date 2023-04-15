class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all

    @list_of_actors = matching_actors.order({ :created_at => :desc })
  
    render({ :template => "actor_templates/index.html.erb" })
  end

  def actor_details

    actor_id = params.fetch("actor_id")
    @this_actor = Actor.where({ :id => actor_id }).at(0)

    #this will give me an array where I can do a loop
    @this_character = Character.where({ :actor_id => actor_id })

    render({ :template => "actor_templates/actor_details.html.erb" })
  end

end
