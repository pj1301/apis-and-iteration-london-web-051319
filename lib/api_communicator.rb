require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  film_array = []
  collected_films = []
  response_hash["results"].each do |characters|
   if character_name = characters["name"]
      film_array << characters["films"]
   else 
      nil
   end
   film_array[0].each do |film_url|
      film_array_response_string = RestClient.get(film_url)
      collected_films << film_array_response_hash = JSON.parse(film_array_response_string)
   end
   collected_films
end

# iterate over the response hash to find the collection of `films` for the given
#   `character` – DONE
# collect those film API urls, make a web request to each URL to get the info
#  for that film – DONE
# return value of this method should be collection of info about each film.
      #  i.e. an array of hashes in which each hash reps a given film – DONE
# this collection will be the argument given to `print_movies`
#  and that method will do some nice presentation stuff like puts out a list
#  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films) # take all movies then delete duplicates
   # some iteration magic and puts out the movies in a nice list
   response_string = RestClient.get('http://www.swapi.co/api/people/')
   response_hash = JSON.parse(response_string)
   # response_hash.each do |details|
   #    response_hash[details]
   puts film_array
end

binding.pry
# binding.pry 
def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
