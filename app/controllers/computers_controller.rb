class ComputersController < ApplicationController
  before_action :set_computer, only: [:show, :update, :destroy]

  # GET /computers
  def index
    @computers = Computer.includes(:ram_memories).all
    render json: @computers, include: { ram_memories: { only: [:id, :capacity, :manufacturer, :created_at, :updated_at] } }
  end

  # GET /computers/1
  def show
    render json: @computer, include: { ram_memories: { only: [:id, :capacity, :manufacturer, :created_at, :updated_at] } }
  end

  # POST /computers
  def create
    @computer = Computer.new(computer_params)

    if @computer.save
      render json: @computer, status: :created, location: @computer
    else
      render json: @computer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /computers/1
  def update
    if @computer.update(computer_params)
      render json: @computer
    else
      render json: @computer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /computers/1
  def destroy
    @computer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computer
      @computer = Computer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def computer_params
      params.require(:computer).permit(:client_id, :processor_id, :mother_board_id, :video_card_id, :ram_memory_ids => [])
    end


end
