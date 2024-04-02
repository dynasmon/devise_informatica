# == Schema Information
#
# Table name: clients
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Client < ApplicationRecord
  has_one :computer
  belongs_to :processador
  belongs_to :mother_board
  has_many :computer_memory_rams, class_name: "ComputerMemoryRam"
  belongs_to :video_cards, class_name: "VideoCards"

  validate :validar_montagem

  private

  def validar_montagem
    errors.add(:processor, "é possível selecionar apenas um processador por máquina") if processador.blank?
    errors.add(:mother_board, "é possível selecionar apenas uma placa mãe por máquina") if placa_mae.blank?
    errors.add(:mother_board, "não suporta a marca do processador escolhido") unless placa_mae.marca == processador.marca
    errors.add(:computer_memory_rams, "a máquina deve ter pelo menos uma memória RAM") if computer_memory_rams.blank?
    errors.add(:computer_memory_rams, "a quantidade total de memórias RAM não pode exceder a capacidade da placa mãe") if computer_memory_rams.sum(:capacidade) > placa_mae.capacidade_maxima_memoria_ram
    errors.add(:video_card, "é possível selecionar apenas uma placa de vídeo para compor a máquina") if graphics_card.blank?
    errors.add(:video_card, "não é possível selecionar uma placa de vídeo se a placa mãe possui vídeo integrado") if placa_mae.video_integrado && graphics_card.present?
  end
end
