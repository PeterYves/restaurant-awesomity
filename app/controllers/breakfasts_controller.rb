class BreakfastsController < ApplicationController
  before_action :set_breakfast, only: [:show, :edit, :update, :destroy]

  # GET /breakfasts
  def index
    @breakfasts = Breakfast.all
  end

  # GET /breakfasts/1
  def show
  end

  # GET /breakfasts/new
  def new
    @breakfast = Breakfast.new
    @breakfast.user_id = current_user.id
    @breakfast.restos.build
    @breakfast.resto_breakfasts.build
  end

  # GET /breakfasts/1/edit
  def edit
  end

  # POST /breakfasts
  def create
    @breakfast = Breakfast.new(breakfast_params)
    @breakfast.user_id = current_user.id

    if @breakfast.save
      redirect_to @breakfast, notice: 'breakfast was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /breakfasts/1
  def update
    if @breakfast.update(breakfast_params)
      redirect_to @breakfast, notice: 'breakfast was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /breakfasts/1
  def destroy
    @breakfast.destroy
    redirect_to breakfasts_url, notice: 'breakfast was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breakfast
      @breakfast = Breakfast.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def breakfast_params
      params.require(:breakfast).permit(:name, :price, :user_id)
    end
end
