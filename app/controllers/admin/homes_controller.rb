class Admin::HomesController < ApplicationController
 def top
    @post_movies = PostMovie.all
 end
end
