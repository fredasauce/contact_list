@contacts = [
  { name: "Bob", phone: "801-735-3290" },
  { name: "Jill", phone: "801-319-9225" }
]

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
      create_contact
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
  @contacts.each_with_index do |c, i|
    puts "#{i + 1}) #{c[:name]} 
    #{c[:phone]}"
  end
end

def create_contact
  print "Enter new contact name: "
  user_name = gets.strip
  print "Enter new contact phone: "
  user_phone = gets.strip
  @contacts << { name: user_name, phone: user_phone }
  puts "Updated contact list: "
  view_contacts
  main_menu  
end

def edit_contact
  puts "Please select a contact to edit:"
  view_contacts
  user_choice = gets.strip.to_i - 1
  if user_choice >= 0 && user_choice <= @contacts.length
    puts @contacts[user_choice][:name]
    [:phone]
    puts "Would you like to change the:"
    puts "1) Name"
    puts "2) Phone"
    puts "3) Go Back"
    user_pick = gets.strip
    case user_pick
      when "1"
        puts "Edit name: #{@contacts.fetch(user_choice)[:name]}"
        print "> "
        user_nn = gets.strip
        @contacts[user_choice][:name] = user_nn
        puts "Updated contact list:"
        view_contacts
      when "2"
        puts "Edit phone: #{@contacts.fetch(user_choice)[:phone]}"
        print "> "
        user_np = gets.strip
        @contacts[user_choice][:phone] = user_np
        puts "Updated contact list:"
        view_contacts
      when "3"
        main_menu
    end        
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