class MotherBoardsController < ApplicationController
  before_action :set_mother_board, only: [:show, :update, :destroy]

  # GET /mother_boards
  def index
    @mother_boards = MotherBoard.all
    render json: @mother_boards
  end

  # GET /mother_boards/1
  def show
    render json: @mother_board
  end

  # POST /mother_boards
  def create
    @mother_board = MotherBoard.new(mother_board_params)

    if @mother_board.save
      render json: @mother_board, status: :created, location: @mother_board
    else
      render json: @mother_board.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mother_boards/1
  def update
    if @mother_board.update(mother_board_params)
      render json: @mother_board
    else
      render json: @mother_board.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mother_boards/1
  def destroy
    @mother_board.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mother_board
      @mother_board = MotherBoard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mother_board_params
      params.require(:mother_board).permit(:supports_intel, :supports_amd, :integrated_video, :number_of_slots, :video_card_id, :name)
    end
end
