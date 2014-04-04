class Rolodex

  attr_reader :contacts

  def initialize
    @contacts = []
    @id = 1
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def find(contact_id)
    @contacts.find {|contact| contact.id == contact_id }
  end

  def remove_contact(contact)
    @contacts.delete(contact)
  end

end



  # @@counter = 0

  # attr_accessor :first_name, :last_name, :email, :note, :id

  # def initialize(first_name,last_name,email,title)
  #   @first_name = first_name 
  #   @last_name = last_name
  #   @email = email
  #   @note = note
  #   @id = Contact.get_id
  # end

  # def to_s
  #   "ID: #{@id} Name: #{@name}\nNotes:#{@notes}"
  # end

  # def self.get_id
  #   @@counter += 1
  #   @@counter 
  # end  