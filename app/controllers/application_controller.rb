class ApplicationController < ActionController::API
   def hello_world
    render json: { message: "♦️ Hello world from Ruby on Rails API ♦️" }
   end


end