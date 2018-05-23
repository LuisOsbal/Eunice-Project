Rails.application.routes.draw do
  get 'dashboards/index'
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'welcome/index'
  root 'welcome#index'

  resources :profiles, only: %i[index]
  resources :dashboards, only: %i[index]
  resources :advertisements

  def default_url_options(_options = {})
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
end
