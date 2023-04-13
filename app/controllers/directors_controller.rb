class DirectorsController < ApplicationController
  def index

    @list_of_directors = Director.all
    render( { :template => "director_templates/index.html.erb" })
  end

  def oldest
    require "date"

    @oldest_director = Director.all.where.not({:dob => nil}).order({ :dob => :asc }).at(0)
 

    render( { :template => "director_templates/eldest.html.erb" })
  end

  def youngest
    @youngest_director = Director.order({ :dob => :desc}).at(0)

    render ({ :template => "director_templates/youngest.html.erb" })
  end

  def director_details
    director_id = params.fetch("director_id")

    @this_director = Director.where({ :id => director_id}).at(0)
  
    @movies_directed = Movie.where({ :director_id => director_id})

    render ({ :template => "director_templates/show_details.html.erb" })
  end

end
