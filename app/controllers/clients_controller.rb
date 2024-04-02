class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :update, :destroy]

  # GET /clients
  def index
    @clients = Client.includes(computer: :ram_memories).all
    render json: @clients, include: { computer: { include: { ram_memories: { except: [:computer_id, :created_at, :updated_at] } }, except: [:created_at, :updated_at] } }
  end

  # GET /clients/:id
  def show
    render json: @client, include: { computer: { include: { ram_memories: { except: [:computer_id, :created_at, :updated_at] } }, except: [:created_at, :updated_at] } }
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client, status: :created
    else
      render json: { errors: @client.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: { errors: @client.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    head :no_content
  end

  # GET /clients/1/computer
  def computer
    @client = Client.find(params[:client_id])
    @computer = @client.computer
    render json: @computer
  end

  # POST /clients/1/computer
  def create_computer
    @client = Client.find(params[:client_id])
    @computer = @client.build_computer(computer_params)

    if @computer.save
      render json: @computer, status: :created
    else
      render json: { errors: @computer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:processador_id, :mother_board_id, :placa_video_id)
  end

  def computer_params
    params.require(:computer).permit(:processor_id, :mother_board_id, :video_card_id, :ram_memory_ids => [])
  end
end
