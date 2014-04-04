require_relative 'contact'
require_relative 'rolodex'
require 'data_mapper'
require 'sinatra'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

#route

class Contact

  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :note, String

end

DataMapper.finalize
DataMapper.auto_upgrade!

@@rolodex = Rolodex.new

@@rolodex.add_contact(Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder"))

get "/contacts/1000" do
  @contact = @@rolodex.find(1000)
  erb :show_contact
end

get '/' do
  erb :index
end

get "/contacts" do
  @conrtacts = Contact.all
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

get "/show_contact" do
    @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :edit_contact
  else 
    raise Sinatra::NotFound
  end
end

get '/contacts/remove' do 
  erb :remove_contact
end

post '/contacts' do
  contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :notes => params[:notes]
  )
  redirect to ('/contacts/new')
end


# post '/contacts' do
#   new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
#   @@rolodex.add_contact(new_contact)
#   contact = Contact.create (
#     :first_name => params[:first_name],
#     :last_name => params[:last_name],
#     :email => params[:email],
#     :note => params[:note]
#   )
#   redirect to('/contacts')
# end


