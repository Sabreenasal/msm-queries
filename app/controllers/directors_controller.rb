class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all

    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "directors/index" })
  end

  def youngest
    render({ :template => "directors/youngest" })
  end

  def eldest
    render({ :template => "directors/eldest" })
  end

  def show


    the_id = params.fetch("path_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)


    render({ :template => "directors/show" })
  end

  def create
    the_director = Director.new
    the_director.name = params.fetch("query_name")
    the_director.dob = params.fetch("query_dob")
    the_director.bio = params.fetch("query_bio")
    the_director.image = params.fetch("query_image_url")

    if the_director.valid?
      the_director.save
      redirect_to("/directors", { :notice => "Director created successfully." })
    else
      redirect_to("/directors", { :alert => the_director.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_director = Director.where({ :id => the_id }).at(0)

    the_director.name = params.fetch("query_name")
    the_director.dob = params.fetch("query_dob")
    the_director.bio = params.fetch("query_bio")
    the_director.image = params.fetch("query_image_url")

    if the_director.valid?
      the_director.save
      redirect_to("/directors/#{the_director.id}", { :notice => "Director updated successfully."} )
    else
      redirect_to("/directors/#{the_director.id}", { :alert => the_director.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_director = Director.where({ :id => the_id }).at(0)

    the_director.destroy

    redirect_to("/directors", { :notice => "Director deleted successfully."} )
  end
end
