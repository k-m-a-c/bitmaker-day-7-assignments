require_relative 'contact.rb'
require_relative 'rolodex.rb'
require 'sinatra'

$rolodex = Rolodex.new

get "/" do
  @crm_app_name = "Kevin's CRM"
  erb :index
end

get "/contacts" do
  @contacts_page_title = "My Contacts"

  erb :contacts
end

get "/contacts/delete" do
  @delete_contact_page_title = "Delete a Contact"
  erb :delete_contact
end

get "/contacts/edit" do
  @edit_page_title = "Edit a Contact"
  erb :edit_contact
end

get "/contacts/add" do
  @add_contact_page_title = "Add a Contact"
  erb :add_contact
end

get "/contacts/show" do
  @contact_attribute_page_title = "See a Contact's Attributes"
  erb :show_contact
end
