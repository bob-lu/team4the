class AchievementsController < ApplicationController
  # GET /achievements
  # GET /achievements.json
  def index
    @achievements = Achievement.all
    #team_achievements = Achievement.team_points(current_user.team)
    respond_to do |format|
      format.html
      #format.json { render json: team_achievements }
    end
  end

  # GET /achievements/1
  # GET /achievements/1.json
  def show
    @achievement = Achievement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @achievement }
    end
  end

  # GET /achievements/new
  # GET /achievements/new.json
  def new
    @achievement = Achievement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @achievement }
    end
  end

  # GET /achievements/1/edit
  def edit
    @achievement = Achievement.find(params[:id])
  end

  # POST /achievements
  def create
    achievement = Achievement.find(params[:achievement][:id])
    
    if achievement.is_single_point
      achievementPoint = AchievementPoint.new({ point: achievement.point, user: current_user, achievement: achievement })
    else
      # You can access multi achievement value via "params[:achievement][:value]"
      # It maybe a string so you can do something like ".to_i" to convert to a integer.
    end
        
    respond_to do |format|
      if achievementPoint.save
        format.html { redirect_to achievements_path, notice: 'Achievements was successfully saved.' }
      else
        format.html { redirect_to achievements_path, notice: error }
      end
    end
  end

  # PUT /achievements/1
  # PUT /achievements/1.json
  def update
    @achievement = Achievement.find(params[:id])

    respond_to do |format|
      if @achievement.update_attributes(params[:achievement])
        format.html { redirect_to @achievement, notice: 'Achievement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievements/1
  # DELETE /achievements/1.json
  def destroy
    @achievement = Achievement.find(params[:id])
    @achievement.destroy

    respond_to do |format|
      format.html { redirect_to achievements_url }
      format.json { head :no_content }
    end
  end
end
