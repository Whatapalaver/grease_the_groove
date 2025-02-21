class ActiveDaysController < ApplicationController
  before_action :set_active_day, only: %i[ show edit update destroy ]


  def index
    @active_days = current_user.active_days.all.order(day: :desc)
  end

  def show
  end

  def new
    @active_day = current_user.active_days.new({ day: Date.today })
  end

  def edit
  end

  def create
    puts active_day_params
    @active_day = current_user.active_days.new(active_day_params)

    if @active_day.save
      redirect_to @active_day, notice: "Active day was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @active_day.update(active_day_params)
      redirect_to @active_day, notice: "Active day was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @active_day.destroy!
    redirect_to active_days_path, status: :see_other, notice: "Active day was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_active_day
      @active_day = current_user.active_days.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def active_day_params
      params.require(:active_day).permit(:day)
    end
end
