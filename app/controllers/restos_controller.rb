class RestosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_resto, only: [:show, :edit, :update, :destroy]

  # GET /restos
  # GET /restos.json
  def index
    @q = Resto.ransack(params[:q])
    @restos = @q.result(distinct: true)
  end

  # GET /restos/1
  # GET /restos/1.json
  def show
  end

  # GET /restos/new
  def new
    @resto = Resto.new
    4.times {@resto.breakfasts.build}
    4.times {@resto.lunches.build}
  end

  # GET /restos/1/edit
  def edit
    1.times {@resto.breakfasts.build}
    1.times {@resto.lunches.build}
  end

  def create
    @resto = current_user.restos.build(resto_params)
    respond_to do |format|
      if @resto.save
        format.html { redirect_to @resto, notice: 'Resto was successfully created.' }
        format.json { render :show, status: :created, location: @resto }
      else
        format.html { render :new }
        format.json { render json: @resto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @resto.update(resto_params)
        format.html { redirect_to @resto, notice: 'Resto was successfully updated.' }
        format.json { render :show, status: :ok, location: @resto }
      else
        format.html { render :edit }
        format.json { render json: @resto.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resto.destroy
    respond_to do |format|
      format.html { redirect_to restos_url, notice: 'Resto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resto
      @resto = Resto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resto_params
      params.require(:resto).permit(:name, :location,:photo,:image_cache,:website,:currency,:price_range,:table_booking,:cuisine,:online_delivery,:user_id, breakfasts_attributes: [:id, :name, :price], lunches_attributes: [:id, :name, :price])
    end
end
