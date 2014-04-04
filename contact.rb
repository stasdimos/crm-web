class Contact

  @@counter = 0

  attr_accessor :first_name, :last_name, :email, :title, :id

  def initialize(first_name,last_name,email,title)
    @first_name = first_name 
    @last_name = last_name
    @email = email
    @title = title
    @id = Contact.get_id
  end

  def to_s
    "ID: #{@id} Name: #{@name}\nNotes:#{@notes}"
  end

  def self.get_id
    @@counter += 1
    @@counter 
  end

  
end
