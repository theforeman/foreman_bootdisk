Foreman::Application.routes.draw do
  constraints(:id => /[^\/]+/) do
    resources :hosts do
      member do
        get 'bootdisk_iso'
      end
    end
  end
end
