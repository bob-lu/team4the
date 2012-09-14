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
    begin
      achievement = Achievement.find(params[:achievement][:id])
      
      if achievement.is_single_point
        achievement.create_or_update_point current_user, achievement.point
      else
        value = params[:achievement][:value].to_s

        # Get value from form, strip all spaces and chars (except dot)
        value = value.gsub(/[^0-9\.]+/, "")

        raise ArgumentError.new("Value must be an integer") if value.blank?
        
        achievement.calculate_and_save_point current_user, value
      end
          
      respond_to do |format|
        format.html { redirect_to achievements_path, notice: 'Achievements was successfully saved.' }
      end
    rescue ArgumentError => ex
      redirect_to achievements_path, :flash => { :error => ex.message }
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
    @achievement = AchievementPoint.find(params[:id])
    return if not current_user == @achievement.user
    @achievement.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.json { head :no_content }
    end
  end
end
