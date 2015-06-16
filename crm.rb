require_relative 'contact.rb'
require 'sinatra'

get "/" do
  @crm_app_name = "Kevin's CRM"
  erb :index
end

get "/contacts" do
  @contacts_page_title = "My Contacts"
  @contacts = []
  @contacts << Contact.new("Jacob", "Dawson", "jdawg@gmail.com", "Lunatic.")
  @contacts << Contact.new("Jill", "Cates", "JC@gmail.com", "Sexy yogi.")
  @contacts << Contact.new("Alex", "Warme", "awarme@gmail.com", "Asshat.")

  erb :contacts
end

get "/contacts/delete" do
  @delete_contact_page_title = "Delete a Contact"
  erb :delete
end

get "/contacts/edit" do
  @edit_page_title = "Edit a Contact"
  erb :edit
end

get "/contacts/add" do
  @add_contact_page_title = "Add a Contact"
  erb :add
end

get "/contacts/show" do
  @contact_attribute_page_title = "See a Contact's Attributes"
  erb :show
end
