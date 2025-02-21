class DailySessionsController < ApplicationController
  before_action :set_daily_session, only: %i[ show edit update destroy ]
  before_action :set_active_day, only: %i[ show edit update destroy ]


  def show
  end

  def new
    @active_day = current_user.active_days.find(params[:active_day_id])
    @daily_session = @active_day.daily_sessions.new
  end

  def edit
  end

  def create
    @active_day = current_user.active_days.find(params[:active_day_id])
    @daily_session = @active_day.daily_sessions.new(daily_session_params)
    @daily_session.position = @active_day.daily_sessions.count

    if @daily_session.save
      redirect_to active_day_daily_session_path(@active_day, @daily_session), notice: "Daily session was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @daily_session.update(daily_session_params)
      redirect_to active_day_path(@active_day), notice: "Daily session was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @daily_session.destroy!
    redirect_to active_day_path, status: :see_other, notice: "Daily session was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_session
      @daily_session = DailySession.find(params[:id])
    end

    def set_active_day
      @active_day = current_user.active_days.find(params[:active_day_id])
    end

    # Only allow a list of trusted parameters through.
    def daily_session_params
      params.require(:daily_session).permit(:active_day_id, :name, :notes)
    end
end
