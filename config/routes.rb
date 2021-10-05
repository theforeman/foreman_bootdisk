# frozen_string_literal: true

ForemanBootdisk::Engine.routes.draw do
  resources :disks, only: [] do
    get 'generic', on: :collection
    get 'help', on: :collection
    constraints(id: %r{[^/]+}) do
      get 'hosts/:id', on: :collection, to: 'disks#host'
      get 'full_hosts/:id', on: :collection, to: 'disks#full_host'
      get 'subnet/:id', on: :collection, to: 'subnet_disks#subnet'
      get 'bootdisk_options/:id', on: :collection, to: 'disks#bootdisk_options'
    end
  end

  namespace :api, defaults: { format: 'json' } do
    scope '(:apiv)', module: :v2, defaults: { apiv: 'v2' }, apiv: /v1|v2/, constraints: ApiConstraints.new(version: 2, default: true) do
      get 'generic', to: 'disks#generic'
      constraints(id: %r{[^/]+}) do
        get 'hosts/:id', to: 'disks#host'
        get 'subnets/:id', to: 'subnet_disks#subnet'
      end
    end
  end
end
