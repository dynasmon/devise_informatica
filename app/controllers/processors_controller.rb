class ProcessorsController < ApplicationController
  before_action :set_processor, only: [:show, :update, :destroy]

  # GET /processors
  def index
    @processors = Processor.all
    render json: @processors
  end

  # GET /processors/1
  def show
    render json: @processor
  end

  # POST /processors
  def create
    @processor = Processor.new(processor_params)

    # Encontrar a marca existente pelo brand_id fornecido
    @processor.brand = Brand.find_by_id(params[:processor][:brand_id])

    if @processor.save
      render json: @processor, status: :created, location: @processor
    else
      render json: @processor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /processors/1
  def update
    if @processor.update(processor_params)
      render json: @processor
    else
      render json: @processor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /processors/1
  def destroy
    @processor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processor
      @processor = Processor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def processor_params
      params.require(:processor).permit(:brand_id, :name, :brand_name)
    end
end
