Rails.application.routes.draw do

  resources :clients
  resources :computers
  resources :mother_boards
  resources :processors
  resources :ram_memorys
  resources :brands
  resources :video_cards
end
