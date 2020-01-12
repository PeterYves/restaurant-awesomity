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
    @lunch = Lunch.all
    @breakfast = Breakfast.all
  end

  # GET /restos/new
  def new
    @resto = Resto.new
    @resto.lunches.build
    @resto.resto_lunches.build
    @resto.breakfasts.build
    @resto.resto_breakfasts.build
  end

  # GET /restos/1/edit
  def edit
  end

  # POST /restos
  # POST /restos.json
  def create
    @resto = current_user.restos.build(resto_params)
    @lunches= Lunch.all
    @breakfasts= Breakfast.all
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

  # PATCH/PUT /restos/1
  # PATCH/PUT /restos/1.json
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

  # DELETE /restos/1
  # DELETE /restos/1.json
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
      params.require(:resto).permit(:name, :location,:photo,:image_cache,:website,:currency,:price_range,:table_booking,:cuisine,:online_delivery,:user_id, lunch_ids: [],breakfast_ids: [])
    end
end
