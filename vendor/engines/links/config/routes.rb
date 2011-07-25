::Refinery::Application.routes.draw do
  get "/links" => "link_categories#index"

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :links, :except => :show do
      collection do
        post :update_positions
      end
    end
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :link_categories, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
