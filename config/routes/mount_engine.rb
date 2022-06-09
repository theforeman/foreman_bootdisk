# frozen_string_literal: true

Foreman::Application.routes.draw do
  mount ForemanBootdisk::Engine, at: '/', as: 'foreman_bootdisk'
end
