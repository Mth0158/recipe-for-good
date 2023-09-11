Rails.application.routes.draw do
  get "*path", to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end

  namespace :api do
    namespace :v1 do
      resources :ingredients, only: %i[index]
      resources :recipes, only: %i[index show]
    end
  end
end
