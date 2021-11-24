Rails.application.routes.draw do
  # rails g controllerでアクション名を指定したら自動的に追加された
  get 'todolists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # HTMLメソッド 'URL' => 'controller#action'
  get 'top' => 'homes#top'

  # ../todolistsというurlに「postメソッドで」リクエストした時
  post 'todolists' => 'todolists#create'

  get 'todolists' => 'todolists#index'

  get 'todolists/:id' => 'todolists#show', as:'todolist'

  get 'todolists/:id/edit' => 'todolists#edit', as:'edit_todolist'

  patch 'todolists/:id' => 'todolists#update', as:'update_todolist'
end
