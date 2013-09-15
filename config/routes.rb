Rails.application.routes.draw do
  resources :disks, :module => 'bootdisk', :only => :index do
    get 'generic_iso', :on => :collection
  end

  constraints(:id => /[^\/]+/) do
    resources :hosts do
      member do
        get 'bootdisk_iso'
      end
    end
  end
end
