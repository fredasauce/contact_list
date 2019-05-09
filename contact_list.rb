@contacts = ["Bob", "Jill"]

def main_menu
  puts "--- Ruby Contact List ---"
  puts "1) Create Contact"
  puts "2) Edit Contact"
  puts "3) Delete a Contact"
  puts "4) View Contacts"
  puts "5) Exit"
  input = gets.strip
  case input
    when "1"
      print "Enter new contact name: "
      user_contact = gets.strip
      @contacts << user_contact
      puts "Updated contact list: "
      view_contacts
      main_menu
    when "2"
      edit_contact
    when "3"
      delete_contact
    when "4"
      view_contacts
      main_menu
    when "5"
      puts "Goodbye!"
      exit
    else
      puts "Invalid input. Try again!"
      main_menu
  end
end

def view_contacts
  @contacts.each_with_index do |name, i|
    puts "#{i + 1}) #{name}"
  end
end

def edit_contact
  puts "Please select a contact to edit:"
  view_contacts
  user_choice = gets.strip.to_i - 1
  if user_choice >= 0 && user_choice <= @contacts.length
    puts "What changes would you like to make to: #{@contacts.fetch(user_choice)}"
    print "> "
    user_edit = gets.strip
    @contacts[user_choice] = user_edit
    puts "Updated contact list: "
    view_contacts
  else
    puts "Invalid Selection"
    edit_contact
  end
  main_menu
end

def delete_contact
  puts "Please select a contact to delete: "
  view_contacts
  user_delete = gets.strip.to_i - 1
  if user_delete >= 0 && user_delete <= @contacts.length
    @contacts.delete_at(user_delete)
    puts "Updated contact list: "
    view_contacts
  else
    puts "Invalid Selection"
    delete_contact
  end
  main_menu
end


main_menu