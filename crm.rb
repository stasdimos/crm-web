require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

@@rolodex = Rolodex.new

get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get "/contacts" do
  @contacts_view = "ALL Contacts"   
  erb :contacts

  # @contacts = []
  # @contacts << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
  # @contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
  # @contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")

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

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  @@rolodex.add_contact(new_contact)
  redirect to('/contacts')
end