Rails.application.routes.draw do
  # rails g controllerでアクション名を指定したら自動的に追加された
  get 'todolists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # HTMLメソッド 'URL' => 'controller#action'
  get 'top' => 'homes#top'

  # ../todolistsというurlにpostメソッドでリクエストした時
  post 'todolists' => 'todolists#create'
end
