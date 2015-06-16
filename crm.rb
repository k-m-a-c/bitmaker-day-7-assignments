require 'sinatra'

get "/" do
  @crm_app_name = "Kevin's CRM"
  erb :index
end

get "/contacts" do
  @contacts_page_title = "My Contacts"
  erb :contacts
end

get "/delete-contact" do
  @delete_contact_page_title = "Delete a Contact"
  erb :delete
end

get "/edit-contact" do
  @edit_page_title = "Edit a Contact"
  erb :edit
end

get "/add-contact" do
  @add_contact_page_title = "Add a Contact"
  erb :add
end

get "/show-attribute" do
  @contact_attribute_page_title = "See a Contact's Attributes"
  erb :show
end
