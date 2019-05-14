require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name) # WORKS
  #make the web request
   response_string = RestClient.get('http://www.swapi.co/api/people/')
   response_hash = JSON.parse(response_string)
   film_array = []
   film_urls = []
   # experimental code
   names = []
   response_hash["results"].each do |object|
      names << object.fetch("name").downcase
   end
   if names.include?(character_name.downcase) == false
      puts "This character does not exist."
      # binding. pry
   else
      #experimental code
      response_hash["results"].each do |characters|
         if character_name == characters["name"].downcase
            film_urls = characters["films"]
         else
            nil
         end
      end
   end
   film_urls
end

def print_movies(films) 
   titles = []
   i=0
   while i < films.length 
      film_array_response_string = RestClient.get(films[i]) #PROBLEM IS HERE
      film_array_response_hash = JSON.parse(film_array_response_string)
      titles << film_array_response_hash["title"]
      i+=1
   end
  puts titles
end

def show_character_movies(character)
   films = get_character_movies_from_api(character)
   print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

# iterate over the response hash to find the collection of `films` for the given
#   `character` – DONE
# collect those film API urls, make a web request to each URL to get the info
#  for that film – DONE
# return value of this method should be collection of info about each film.
#  i.e. an array of hashes in which each hash reps a given film – DONE
# this collection will be the argument given to `print_movies`
#  and that method will do some nice presentation stuff like puts out a list
#  of movies by title. Have a play around with the puts with other info about a given film.