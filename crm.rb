require_relative 'contact.rb'
require_relative 'rolodex.rb'
require 'sinatra'

$rolodex = Rolodex.new

# NAVIGATION HANDLING

get "/" do
  @page_title = "Home | Kevin's CRM"
  @page_h1 = "Main Menu"
  erb :index
end

get "/contacts" do
  @page_title = "Contacts | Kevin's CRM"
  @page_h1 = "Your Contacts"
  erb :contacts
end

get "/contacts/delete" do
  @page_title = "Delete a Contact | Kevin's CRM"
  @page_h1 = "Delete a Contact"
  erb :delete_contact
end

get "/contacts/edit" do
  @page_title = "Edit a Contact | Kevin's CRM"
  @page_h1 = "Edit a Contact"
  erb :edit_contact
end

get "/contacts/add" do
  @page_title = "Add a Contact | Kevin's CRM"
  @page_h1 = "Add a Contact"
  erb :add_contact
end

get "/contacts/show" do
  @page_title = "Show a Contact | Kevin's CRM"
  @page_h1 = "Find a Contact"
  erb :show_contact
end

# REQUEST HANDLING

post "/contacts" do
  puts params

  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:notes])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end