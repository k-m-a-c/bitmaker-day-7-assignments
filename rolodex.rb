class Rolodex
  attr_reader :contacts

  def initialize
    @contacts = []
    @id = 1000

    @contacts << Contact.new("Jacob", "Dawson", "jdawg@gmail.com", "lunatic")
    @contacts << Contact.new("Jill", "Cates", "JC@gmail.com", "yogi")
    @contacts << Contact.new("Alex", "Warme", "awarme@gmail.com", "asshat")
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end
end