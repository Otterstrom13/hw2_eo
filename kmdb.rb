# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Actor.destroy_all
Movie.destroy_all
Role.destroy_all
Studio.destroy_all

# Generate models and tables, according to the domain model.
# Done!! (See db:migrate)

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Insert row into studio table
new_studio = Studio.new
new_studio["name"]= "Warner Bros."
new_studio.save

# Count # of studios
# puts "Studios: #{Studio.all.count}" # Studio count = 1
wb = Studio.find_by({ "name" => "Warner Bros." })

# Insert rows for movies
new_movie = Movie.new
new_movie["title"]= "Batman Begins"
new_movie["year_released"] = 2005
new_movie["rated"] = "PG-13"
new_movie["studio_id"]= wb["id"]
new_movie.save

new_movie = Movie.new
new_movie["title"]= "The Dark Knight"
new_movie["year_released"] = 2008
new_movie["rated"] = "PG-13"
new_movie["studio_id"]= wb["id"]
new_movie.save

new_movie = Movie.new
new_movie["title"]= "The Dark Knight Rises"
new_movie["year_released"] = 2012
new_movie["rated"] = "PG-13"
new_movie["studio_id"]= wb["id"]
new_movie.save

# Count # of movies
#puts "Movies: #{Movie.all.count}" # Movie count = 3

#Insert rows for actors and roles: Batman Begins

new_actor = Actor.new
new_actor["name"] = "Christian Bale"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Michael Caine"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Liam Neeson"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Katie Holmes"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Gary Oldman"
new_actor.save

# Find corresponding actor and movie rows
christian = Actor.find_by({"name"=>"Christian Bale"})
michael = Actor.find_by({"name"=>"Michael Caine"})
liam = Actor.find_by({"name"=>"Liam Neeson"})
katie = Actor.find_by({"name"=>"Katie Holmes"})
gary = Actor.find_by({"name"=>"Gary Oldman"})

batman_begins = Movie.find_by({"title"=>"Batman Begins"})

# Insert roles for Batman Begins

new_role = Role.new
new_role["character_name"]="Bruce Wayne"
new_role["actor_id"]= christian["id"]
new_role["movie_id"]= batman_begins["id"]
new_role.save

new_role = Role.new
new_role["character_name"]="Alfred"
new_role["actor_id"]= michael["id"]
new_role["movie_id"]= batman_begins["id"]
new_role.save

new_role = Role.new
new_role["character_name"]="Ra's Al Ghul"
new_role["actor_id"]= liam["id"]
new_role["movie_id"]= batman_begins["id"]
new_role.save

new_role = Role.new
new_role["character_name"]="Rachel Dawes"
new_role["actor_id"]= katie["id"]
new_role["movie_id"]= batman_begins["id"]
new_role.save

new_role = Role.new
new_role["character_name"]="Commissioner Gordon"
new_role["actor_id"]= gary["id"]
new_role["movie_id"]= batman_begins["id"]
new_role.save

#Insert more actors for The Dark Knight
new_actor = Actor.new
new_actor["name"] = "Heath Ledger"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Aaron Eckhart"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Maggie Gyllenhaal"
new_actor.save

#Find corresponding actor and movie roles
heath = Actor.find_by({"name"=>"Heath Ledger"})
aaron = Actor.find_by({"name"=>"Aaron Eckhart"})
maggie = Actor.find_by({"name"=>"Maggie Gyllenhaal"})

dark_knight = Movie.find_by({"title"=>"The Dark Knight"})

# Insert roles for The Dark Knight
new_role = Role.new
new_role["character_name"]="Bruce Wayne"
new_role["actor_id"]= christian["id"]
new_role["movie_id"]= dark_knight["id"]
new_role.save

new_role = Role.new
new_role["character_name"]="Joker"
new_role["actor_id"]= heath["id"]
new_role["movie_id"]= dark_knight["id"]
new_role.save

new_role = Role.new
new_role["character_name"]="Harvey Dent"
new_role["actor_id"]= aaron["id"]
new_role["movie_id"]= dark_knight["id"]
new_role.save

new_role = Role.new
new_role["character_name"]="Alfred"
new_role["actor_id"]= michael["id"]
new_role["movie_id"]= dark_knight["id"]
new_role.save

new_role = Role.new
new_role["character_name"]="Rachel Dawes"
new_role["actor_id"]= maggie["id"]
new_role["movie_id"]= dark_knight["id"]
new_role.save

# Insert 

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
