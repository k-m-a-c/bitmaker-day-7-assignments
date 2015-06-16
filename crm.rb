require 'sinatra'

get "/" do
  @crm_app_name = "Kevin's CRM"
  erb :index
end