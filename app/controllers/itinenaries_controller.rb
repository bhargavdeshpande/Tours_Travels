class ItinenariesController < ApplicationController
  before_action :set_itinenary, only: [:show, :edit, :update, :destroy]

  # GET /itinenaries
  # GET /itinenaries.json
  def index
    @itinenaries = Itinenary.all
  end

  # GET /itinenaries/1
  # GET /itinenaries/1.json
  def show
  end

  # GET /itinenaries/new
  def new
    @itinenary = Itinenary.new
  end

  # GET /itinenaries/1/edit
  def edit
  end

  # POST /itinenaries
  # POST /itinenaries.json
  def create
    @itinenary = Itinenary.new(itinenary_params)

    respond_to do |format|
      if @itinenary.save
        format.html { redirect_to @itinenary, notice: 'Itinenary was successfully created.' }
        format.json { render :show, status: :created, location: @itinenary }
      else
        format.html { render :new }
        format.json { render json: @itinenary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itinenaries/1
  # PATCH/PUT /itinenaries/1.json
  def update
    respond_to do |format|
      if @itinenary.update(itinenary_params)
        format.html { redirect_to @itinenary, notice: 'Itinenary was successfully updated.' }
        format.json { render :show, status: :ok, location: @itinenary }
      else
        format.html { render :edit }
        format.json { render json: @itinenary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itinenaries/1
  # DELETE /itinenaries/1.json
  def destroy
    @itinenary.destroy
    respond_to do |format|
      format.html { redirect_to itinenaries_url, notice: 'Itinenary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinenary
      @itinenary = Itinenary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinenary_params
      params.require(:itinenary).permit(:state, :country, :tour_id, :login_id)
    end
end
