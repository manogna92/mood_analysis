Rails.application.routes.draw do
  # Routes for the Journal_entry resource:
  # CREATE
  get "/journal_entries/new", :controller => "journal_entries", :action => "new"
  post "/create_journal_entry", :controller => "journal_entries", :action => "create"

  # READ
  get "/journal_entries", :controller => "journal_entries", :action => "index"
  get "/journal_entries/:id", :controller => "journal_entries", :action => "show"

  # UPDATE
  get "/journal_entries/:id/edit", :controller => "journal_entries", :action => "edit"
  post "/update_journal_entry/:id", :controller => "journal_entries", :action => "update"

  # DELETE
  get "/delete_journal_entry/:id", :controller => "journal_entries", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
