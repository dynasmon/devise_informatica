# app/controllers/video_cards_controller.rb

class VideoCardsController < ApplicationController
  before_action :set_video_card, only: [:show, :update, :destroy]

  # GET /video_cards
  def index
    @video_cards = VideoCard.all
    render json: @video_cards
  end

  # GET /video_cards/1
  def show
    render json: @video_card
  end

  # POST /video_cards
  def create
    @video_card = VideoCard.new(video_card_params)

    if @video_card.save
      render json: @video_card, status: :created, location: @video_card
    else
      render json: @video_card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /video_cards/1
  def update
    if @video_card.update(video_card_params)
      render json: @video_card
    else
      render json: @video_card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /video_cards/1
  def destroy
    @video_card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_card
      @video_card = VideoCard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def video_card_params
      params.require(:video_card).permit(:name, :memory)
    end
end
