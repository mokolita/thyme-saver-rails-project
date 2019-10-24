class InstructionsController < ApplicationController

    def destroy
        
        i = Instruction.find(id: i_params[:id])
        i.destroy
        redirect_to user_path(current_user)
    end 

    private 

    def i_params
        params.require(:instructions).permit(:id, :notes)
    end 
end
