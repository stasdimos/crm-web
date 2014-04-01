require 'sinatra'

get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get "/contacts" do
   @contacts_view = "Contacts"
   erb :contacts
end

get "/contactsadd" do
  @contacts_add = "Add a Contact!"
  erb :contactsadd
end

get "/contactsid" do
  @contacts_id = "View Contact ID!!"
  erb :contactsid
end

get "/contactsedit" do
  @contacts_edit = "Edit a Contact!!!"
  erb :contactsedit
end
