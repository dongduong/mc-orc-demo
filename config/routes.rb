Rails.application.routes.draw do
  root 'ocr#index'

  get 'dashboard/index'
  get 'ocr/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
