require 'sinatra'
require 'data_mapper'
require 'pry'

DataMapper.setup(:default, "sqlite3:crm_dev.sqlite3")

class Contact
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :notes, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

binding.pry

# ROOT ROUTE
get "/" do
  @page_title = "Home | Bowser's CRM"
  @page_h1 = "Home"
  erb :index
end

# /CONTACTS ROUTES
get "/contacts" do
  @page_title = "Contacts | Bowser's CRM"
  @page_h1 = "Your Contacts"
  @contacts = Contact.all
  erb :contacts
end

post "/contacts" do
  contact = Contact.create(
    :first_name => params[:first_name].capitalize,
    :last_name => params[:last_name].upcase,
    :email => params[:email].downcase,
    :notes => params[:note]
  )
  if contact.saved?
    redirect to('/contacts')
  else
    "ERRORRRRR"
  end
end

# /CONTACTS/DELETE ROUTES
get "/contacts/delete" do
  @page_title = "Delete a Contact | Bowser's CRM"
  @page_h1 = "Delete a Contact"
  erb :delete_contact
end

delete "/contacts/:id" do
  @id = params['id'].to_i
  contact = Contact.get(@id)

  if contact
    contact.destroy
    redirect to '/contacts'
  else
    raise Sinatra::NotFound
  end
end

# CONTACTS/EDIT ROUTES
get "/contacts/edit" do
  @page_title = "Edit a Contact | Bowser's CRM"
  @page_h1 = "Edit a Contact"
  @contacts = Contact.all
  erb :edit_contact
end

put "/contacts/:id" do
  id = params['id'].to_i
  first_name = params['first_name'].capitalize
  last_name = params['last_name'].upcase
  email = params['email'].downcase
  note = params['note']

  contact = Contact.get(id)

  if contact
    contact.update(
      first_name: first_name,
      last_name: last_name,
      email: email,
      note: note
    )

    redirect to '/contacts'
  else
    raise Sinatra::NotFound
  end
end

# CONTACTS/ADD ROUTES
get "/contacts/add" do
  @page_title = "Add a Contact | Bowser's CRM"
  @page_h1 = "Add a Contact"
  erb :add_contact
end

# /CONTACTS/SHOW ROUTES
get "/contacts/:id/show" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get "/contacts/show" do
  @page_title = "Show a Contact | Bowser's CRM"
  @page_h1 = "Find a Contact"
  erb :show_contact
end