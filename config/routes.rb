Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'customers/find',     to: 'customers#find'
      get 'customers/find_all', to: 'customers#find_all'
      get 'customers/random',   to: 'customers#random'
      resources :customers,     only: [:index, :show] do
        get '/invoices',        to: 'customers#invoices'
        get '/transactions',    to: 'customers#transactions'
      end

      get 'items/find',       to: 'items#find'
      get 'items/find_all',   to: 'items#find_all'
      get 'items/random',     to: 'items#random'
      resources :items,       only: [:index, :show] do
        get '/invoice_items', to: 'items#invoice_items'
        get '/merchant',      to: 'items#merchant'
      end

      get 'merchants/find',     to: 'merchants#find'
      get 'merchants/find_all', to: 'merchants#find_all'
      get 'merchants/random',   to: 'merchants#random'
      resources :merchants,     only: [:index, :show] do
        get '/items',           to: 'merchants#items'
        get '/invoices',        to: 'merchants#invoices' 
      end

      get 'invoices/find',     to: 'invoices#find'
      get 'invoices/find_all', to: 'invoices#find_all'
      get 'invoices/random',   to: 'invoices#random'
      resources :invoices,     only: [:index, :show] do
        get '/transactions',   to: 'invoices#transactions'
        get '/invoice_items',  to: 'invoices#invoice_items'
        get '/items',          to: 'invoices#items'
        get '/customer',       to: 'invoices#customer'
        get '/merchant',       to: 'invoices#merchant'
      end

      get 'invoice_items/find',     to: 'invoice_items#find'
      get 'invoice_items/find_all', to: 'invoice_items#find_all'
      get 'invoice_items/random',   to: 'invoice_items#random'
      resources :invoice_items,     only: [:index, :show] do
        get '/invoice',             to: 'invoice_items#invoice'
        get '/item',                to: 'invoice_items#item'
      end

      get 'transactions/find',     to: 'transactions#find'
      get 'transactions/find_all', to: 'transactions#find_all'
      get 'transactions/random',   to: 'transactions#random'
      resources :transactions,     only: [:index, :show] do
        get '/invoice',            to: 'transactions#invoice'
      end
    end
  end
end
