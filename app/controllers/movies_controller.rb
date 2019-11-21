class MoviesController < ApplicationController
  ## Getting all movies
  # def index
  #   @movies = Movie.all
  # end

  ## Finding movies where the title match exactly the value in the query
  # def index
  #   if params[:query].present?
  #     @movies = Movie.where(title: params[:query])
  #   else
  #     @movies = Movie.all
  #   end
  # end

  ## Finding movies where the title match the value in the query (case insensitive) with words before and after
  # def index
  #   if params[:query].present?
  #     @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
  #   else
  #     @movies = Movie.all
  #   end
  # end

  ## Finding movies where the title, or the syllabus match the value in the query (case insensitive) with words before and after
  # def index
  #   if params[:query].present?
  #     sql_query = "title ILIKE :query OR syllabus ILIKE :query"
  #     @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
  #   else
  #     @movies = Movie.all
  #   end
  # end

  ## Finding movies where the title, or the syllabus match the value in the query (case insensitive) with words before and after
  ## Or the find the movies where the director's first_name or last_name match the query
  # def index
  #   if params[:query].present?
  #     sql_query = " \
  #       movies.title ILIKE :query \
  #       OR movies.syllabus ILIKE :query \
  #       OR directors.first_name ILIKE :query \
  #       OR directors.last_name ILIKE :query \
  #     "
  #     @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
  #   else
  #     @movies = Movie.all
  #   end
  # end

  ## Finding movies where the title, or the syllabus match the value in the query (case insensitive) with words before and after
  ## Or the find the movies where the director's first_name or last_name match the query
  ## Regardless of the order of the words
  # def index
  #   if params[:query].present?
  #     sql_query = " \
  #       movies.title @@ :query \
  #       OR movies.syllabus @@ :query \
  #       OR directors.first_name @@ :query \
  #       OR directors.last_name @@ :query \
  #     "
  #     @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
  #   else
  #     @movies = Movie.all
  #   end
  # end

  ## First pg_search method: Search on movies and directors
  def index
    if params[:query].present?
      @movies = Movie.search_by_title_and_syllabus(params[:query])
    else
      @movies = Movie.all
    end
  end

  ## Second pg_search method: Search across multiple models
  def index
    if params[:query].present?
      @movies = Movie.global_search(params[:query])
    else
      @movies = Movie.all
    end
  end
end
