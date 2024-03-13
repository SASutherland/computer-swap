require "date"

# CLASSES
class Owner
  attr_accessor :id, :first_name, :last_name, :phone_number
  def initialize(attributes={})
    @id = attributes[:id]
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @phone_number = attributes[:phone_number]
  end
end

class Animal
  attr_accessor :id, :name, :species, :treatments, :last_rabies_shot, :owner_id
  def initialize(attributes={})
    @id = attributes[:id]
    @name = attributes[:name]
    @species = attributes[:species]
    @treatments = attributes[:treatments] || []
    @last_rabies_shot = attributes[:last_rabies_shot]
    @owner_id = attributes[:owner_id]
  end
end

# DATA
kata = Owner.new(
  id: 1,
  first_name: "Kata",
  last_name: "Szell",
  phone_number: "20-822-5380"
)

shawn = Owner.new(
  id: 2,
  first_name: "Shawn",
  last_name: "Sutherland",
  phone_number: "20-224-3817"
)

arti = Animal.new(
  id: 1,
  name: "Arthur",
  species: "Dog",
  treatments: [{
    name: "Neutered",
    date: "2015-02-20"
  }],
  last_rabies_shot: "2018-09-01",
  owner_id: 1
)

glo = Animal.new(
  id: 2,
  name: "Gloria",
  species: "Dog",
  treatments: [{
    name: "Neutered",
    date: "2016-01-01"
  },
  {
    name: "Rabies shot",
    date: "2023-09-01"
  }],
  last_rabies_shot: "2023-09-01",
  owner_id: 1
)

kyle = Animal.new(
  id: 3,
  name: "Kyle",
  species: "Dog",
  treatments: [],
  last_rabies_shot: nil,
  owner_id: 2
)

# ARRAYS
animals = [arti, glo, kyle]
owners = [kata, shawn]

# MENU
def menu
  puts "--------------------"
  puts "----- SUPER VET ----"
  puts "--------------------"
  puts "1. List all animals"
  puts "2. Register new animal"
  puts "3. Register new treatment"
  puts "4. Search for an owner"
  puts "5. Search for an animal"
  puts "6. List animals who need rabies shot"
  puts "7. Quit"
  print "> "
end

# FUNCTIONS
def display(animals)
  animals.each do |animal|
    if animal.treatments == []
      treatments_string = "None"
    end

    animal.treatments == [] ? treatments_string = "None" : treatments_string = animal.treatments.map { |treatment| "#{treatment[:name]} on #{treatment[:date]}" }.join(" | ")
    puts "#{animal.id}: #{animal.name} - #{animal.species}. Treatments: #{treatments_string}"
  end
end


def display_owners(owners)
  owners.each do |owner|
    puts "#{owner.id}: #{owner.first_name} #{owner.last_name} - #{owner.phone_number}"
  end
end

def new_animal(owners, animals)
  puts "Are you an existing owner? (Y/N)"
  owner_choice = gets.chomp.downcase

  if owner_choice == "y"
    puts "Choose your owner ID:"
    display_owners(owners)
    owner_id = gets.chomp.to_i
  else
    puts "Enter your first name:"
    first_name = gets.chomp

    puts "Enter your last name:"
    last_name = gets.chomp

    puts "Enter your phone number:"
    phone_number = gets.chomp

    new_owner_id = owners.size + 1
    owners << Owner.new(id: new_owner_id, first_name: first_name, last_name: last_name, phone_number: phone_number)

    owner_id = new_owner_id
  end

  puts "Enter the name of the animal:"
  name = gets.chomp

  puts "Enter the species of the animal:"
  species = gets.chomp

  puts "Enter the last rabies shot date (YYYY-MM-DD):"
  last_rabies_shot = gets.chomp

  new_animal_id = animals.size + 1
  animals << Animal.new(id: new_animal_id, name: name, species: species, last_rabies_shot: last_rabies_shot, owner_id: owner_id)

  puts "New animal registered successfully!"
end

def new_treatment(owners, animals)
  puts "Enter the last name of the owner:"
  owner_name = gets.chomp

  matching_owners = owners.select { |owner| owner.last_name == owner_name }

  if matching_owners.empty?
    puts "No owner found with the name '#{owner_name}'."
    puts "1. Search again"
    puts "2. Return to the main menu"
    print "> "

    choice = gets.chomp.to_i

    case choice
    when 1
      new_treatment(owners, animals)
    when 2
      return
    else
      puts "Sorry, invalid input. Returning to the main menu."
    end
  else
    puts "Matching owners:"
    display_owners(matching_owners)

    puts "Choose an owner by entering their ID:"
    owner_id = gets.chomp.to_i
    selected_owner = matching_owners.find { |owner| owner.id == owner_id }

    if selected_owner
      puts "Owner selected: #{selected_owner.first_name} #{selected_owner.last_name}"

      # List animals attached to the selected owner
      owner_animals = animals.select { |animal| animal.owner_id == selected_owner.id }
      if owner_animals.empty?
        puts "No animals found for this owner."
        return
      else
        puts "Animals belonging to this owner:"
        owner_animals.each { |animal| puts "#{animal.id}: #{animal.name} - #{animal.species}" }
      end

      puts "Choose an animal by entering their ID:"
      animal_id = gets.chomp.to_i
      selected_animal = owner_animals.find { |animal| animal.id == animal_id }

      if selected_animal
        puts "Animal selected: #{selected_animal.name} - #{selected_animal.species}"

        puts "Choose a treatment:"
        puts "1. Neuter"
        puts "2. Chip"
        puts "3. Rabies shot"
        puts "4. Other"
        print "> "
        treatment_choice = gets.chomp.to_i

        case treatment_choice
        when 1
          selected_animal.treatments << { name: "Neuter", date: Time.now.strftime("%Y-%m-%d") }
          puts "Neuter treatment added successfully."
        when 2
          selected_animal.treatments << { name: "Chipped", date: Time.now.strftime("%Y-%m-%d") }
          puts "Chip treatment added successfully."
        when 3
          selected_animal.treatments << { name: "Rabies shot", date: Time.now.strftime("%Y-%m-%d") }
          selected_animal.last_rabies_shot = Time.now.strftime("%Y-%m-%d")
          puts "Rabies shot treatment added successfully."
        when 4
          puts "Enter the name of the other treatment:"
          other_treatment_name = gets.chomp
          selected_animal.treatments << { name: other_treatment_name, date: Time.now.strftime("%Y-%m-%d") }
          puts "Other treatment added successfully."
        else
          puts "Sorry, invalid treatment choice. Returning to the main menu."
        end
      else
        puts "Invalid animal ID. Returning to the main menu."
      end
    else
      puts "Invalid owner ID. Returning to the main menu."
    end
  end
end

def search_for_owner(owners)
  puts "Enter the last name of the owner you're searching for:"
  search_name = gets.chomp
  matching_owners = owners.select { |owner| owner.last_name == search_name }

  if matching_owners.empty?
    puts "No owners found with the last name '#{search_name}'."
    puts "1. Search again"
    puts "2. Return to the main menu"
    print "> "

    choice = gets.chomp.to_i

    case choice
    when 1
      search_for_owner(owners)
    when 2
      return
    else
      puts "Sorry, invalid input. Returning to the main menu."
    end
  else
    puts "Matching owners:"
    display_owners(matching_owners)

    puts "Choose an owner by entering their ID:"
    owner_id = gets.chomp.to_i
    selected_owner = matching_owners.find { |owner| owner.id == owner_id }

    if selected_owner
      puts "Owner selected: #{selected_owner.first_name} #{selected_owner.last_name}"
      puts "1. Update phone number"
      puts "2. Return to the main menu"
      print "> "

      choice = gets.chomp.to_i

      case choice
      when 1
        puts "Enter the new phone number:"
        new_phone_number = gets.chomp
        selected_owner.phone_number = new_phone_number
        puts "Phone number updated successfully."
      when 2
        return
      else
        puts "Sorry, invalid input. Returning to the main menu."
      end
    else
      puts "Invalid owner ID. Returning to the main menu."
    end
  end
end

def search_for_animal(owners, animals)
  puts "Enter the name of the animal you're searching for:"
  search_name = gets.chomp

  matching_animals = animals.select { |animal| animal.name == search_name }

  if matching_animals.empty?
    puts "No animals found with the name '#{search_name}'."
  else
    puts "Matching animals:"
    matching_animals.each do |animal|
      owner = owners.find { |owner| owner.id == animal.owner_id }
      owner_name = "#{owner.first_name} #{owner.last_name}"
      puts "ID: #{animal.id}, Name: #{animal.name}, Owner Name: #{owner_name}"
    end
  end
end


def animals_who_need_rabies_shot(animals)
  current_date = Date.today
  one_year_ago = current_date.prev_year(1)

  animals_needing_rabies_shot = animals.select do |animal|
    # Check if last_rabies_shot is nil or not a valid date
    last_rabies_shot = animal.last_rabies_shot
    if last_rabies_shot.nil? || last_rabies_shot == "None"
      true # Needs a rabies shot because there's no record
    else
      last_rabies_date = Date.parse(last_rabies_shot)
      last_rabies_date <= one_year_ago
    end
  end

  if animals_needing_rabies_shot.empty?
    puts "No animals need a rabies shot."
  else
    puts "Animals who need a rabies shot:"
    display(animals_needing_rabies_shot)
  end
end


# LOOP
running = true

while running
  menu
  choice = gets.chomp.to_i

  case choice
  when 1
    display(animals)
  when 2
    new_animal(owners, animals)
  when 3
    new_treatment(owners, animals)
  when 4
    search_for_owner(owners)
  when 5
    search_for_animal(owners, animals)
  when 6
    animals_who_need_rabies_shot(animals)
  when 7
    running = false
  else
    puts "Sorry, invalid input. Try again."
  end
end
