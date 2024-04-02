class RamMemorysController < ApplicationController
  before_action :set_ram_memory, only: [:show, :update, :destroy]

  # GET /ram_memorys
  def index
    @ram_memorys = RamMemory.all
    render json: @ram_memorys
  end

  # GET /ram_memorys/1
  def show
    render json: @ram_memory
  end

  # POST /ram_memorys
  def create
    @ram_memory = RamMemory.new(ram_memory_params)

    if @ram_memory.save
      render json: @ram_memory, status: :created, location: @ram_memory
    else
      render json: @ram_memory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ram_memorys/1
  def update
    if @ram_memory.update(ram_memory_params)
      render json: @ram_memory
    else
      render json: @ram_memory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ram_memorys/1
  def destroy
    @ram_memory.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ram_memory
      @ram_memory = RamMemory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ram_memory_params
      params.require(:ram_memory).permit(:name, :size)
    end
end
