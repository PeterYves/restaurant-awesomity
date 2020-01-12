class LunchesController < ApplicationController
  before_action :set_lunch, only: [:show, :edit, :update, :destroy]

  # GET /lunches
  def index
    @lunches = Lunch.all
  end

  # GET /lunches/1
  def show
  end

  # GET /lunches/new
  def new
    @lunch = Lunch.new
    @lunch.user_id = current_user.id
    @lunch.restos.build
    @lunch.resto_lunches.build
  end

  # GET /lunches/1/edit
  def edit
  end

  # POST /lunches
  def create
    @lunch = Lunch.new(lunch_params)
    @lunch.user_id = current_user.id

    if @lunch.save
      redirect_to @lunch, notice: 'lunch was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lunches/1
  def update
    if @lunch.update(lunch_params)
      redirect_to @lunch, notice: 'lunch was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lunches/1
  def destroy
    @lunch.destroy
    redirect_to lunches_url, notice: 'lunch was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lunch
      @lunch = Lunch.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lunch_params
      params.require(:lunch).permit(:name, :price, :user_id)
    end
end
