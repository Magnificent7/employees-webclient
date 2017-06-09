Rails.application.routes.draw do

  resources :employees
  

#          Prefix Verb   URI Pattern                   Controller#Action
#     employees GET    /employees(.:format)          employees#index
#               POST   /employees(.:format)          employees#create
#  new_employee GET    /employees/new(.:format)      employees#new
# edit_employee GET    /employees/:id/edit(.:format) employees#edit
#      employee GET    /employees/:id(.:format)      employees#show
#               PATCH  /employees/:id(.:format)      employees#update
#               PUT    /employees/:id(.:format)      employees#update
#               DELETE /employees/:id(.:format)      employees#destroy
end
