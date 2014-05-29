Foreman::Application.routes.draw do
  mount ForemanBootdisk::Engine, :at => "/bootdisk"
end
