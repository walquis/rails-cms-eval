Rails.application.routes.draw do

  namespace :adminfae do
    resources :articles
    resources :article_categories

    # Pulled from vendor/bundle/ruby/2.4.0/gems/fae-rails-2.0.0/config/routes.rb, where 'admin' was hardcoded.
    get 'pages' => '/adminfae/content_blocks#index', as: 'pages'
    get 'content_blocks/:slug' => '/adminfae/content_blocks#edit', as: 'edit_content_block'
    match 'content_blocks/:slug/update' => '/adminfae/content_blocks#update', via: [:put, :patch], as: 'update_content_block'
  end
  # mount Fae below your admin namespec
  mount Fae::Engine => '/adminfae'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
