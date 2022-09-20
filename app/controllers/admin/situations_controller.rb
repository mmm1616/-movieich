class Admin::SituationsController < ApplicationController
 
 def new
     @situation = Situation.new
 end
 
 def index
     @situations = Situation.all
     @situation = Situation.new
 end
 
 def create
     @situation = Situation.new(situation_params)
     @situation.save
     redirect_to admin_situations_path
 end
 
 def edit
     @situation = Situation.find(params[:id])
 end

 def update
     @situation = Situation.find(params[:id])
    
     if  @situation.update(situation_params)
         redirect_to admin_situations_path
         flash[:notice] = "シチュエーションが更新されました。"
     else
         render :edit
     end
 end
 
 private
  
 def situation_params
     params.require(:situation).permit(:name)
 end
 
end
