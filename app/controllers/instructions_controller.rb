class InstructionsController < ApplicationController

    def index
    end 

    def new
        @plants_user = PlantsUser.new
        @plants_user.instructions.build 
    end 

    def create
    end 
end
