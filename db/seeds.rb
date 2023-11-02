puts "Clearing database..."
Booking.destroy_all
Computer.destroy_all
User.destroy_all
puts "Cleared!"

puts "Creating users, computers..."

macAir = Computer.new(
  brand: "Apple",
  model:  "MacBook Air",
  year: 2022,
  screen_size: "13.0",
  processor: "Apple M2 with 8-core CPU and 10-core GPU",
  ram: "8 GB",
  storage: "256 GB SSD",
  category: "Entertainment",
  os: "Mac OS",
  price: 12,
  description: "The thin and powerful MacBook Air is a 13-inch laptop with a Retina display. This screen provides unprecedented sharpness and accurate color reproduction, allowing you to enjoy your favorite movies, series or photos.",
  user: User.create!(
    first_name: "Bob",
    last_name: "Rutherford",
    email: "bob@fakemail.com",
    address: "Jacob Obrechtstraat 92, 1071 KR Amsterdam",
    password: "password",
  )
)
file_path = Rails.root.join("app/assets/images/pc-macair.jpeg")
file = File.open(file_path)
macAir.photos.attach(io: file, filename: "macAir.jpeg", content_type: "image/jpeg")
macAir.save!

macBook = Computer.new(
  brand: "Apple",
  model:  "MacBook Pro",
  year: 2018,
  screen_size: "16.0",
  processor: "Apple M1 with 8-core CPU and 7-core GPU",
  ram: "16 GB",
  storage: "256 GB SSD",
  category: "Development",
  os: "Mac OS",
  price: 15,
  description: "The MacBook Pro is a thin 16-inch laptop with unprecedented performance, a Touch Bar, and a strong battery. With its 8-core CPU and 8-core GPU, the Apple M1 chip ensures lightning-fast performance and smooth graphics, allowing you to work smoothly with various demanding apps.",
  user: User.create!(
    first_name: "Pauline",
    last_name: "Marsh",
    email: "pauline@fakemail.com",
    address: "Tweede Oosterparkstraat 128, 1092 BP Amsterdam",
    password: "password"
  )
)
file = File.open("app/assets/images/pc-macbook.jpg")
macBook.photos.attach(io: file, filename: "macBook.jpg", content_type: "image/jpg")
macBook.save!

hp = Computer.new(
  brand: "HP",
  model: "ProBook",
  year: 2022,
  screen_size: "15.6",
  processor: "Intel Core i5-1135G7",
  ram: "8 GB",
  storage: "256 GB SSD",
  category: "Documentation",
  os: "Windows",
  price: 9,
  description: "Work quickly and securely on multiple tasks simultaneously with the reliable HP ProBook 450 G8 (27J14EA). With this laptop, you can quickly access your important documents anywhere and work on all your projects without any problems thanks to the powerful i5 processor and 8 GB of RAM, so you can multitask without any problems.",
  user: User.create!(
    first_name: "Danny",
    last_name: "Nelson",
    email: "danny@realmail.com",
    address: "Van Hogendorpstraat 159-121, 1051 GA Amsterdam",
    password: "password"
  )
)
file = File.open("app/assets/images/pc-hp.jpeg")
hp.photos.attach(io: file, filename: "hp.jpeg", content_type: "image/jpg")
hp.save!

msi = Computer.new(
  brand: "MSI",
  model: "Titan GT77",
  year: 2021,
  screen_size: "15.6",
  processor: "Intel Core i9",
  ram: "16Go",
  storage: "128Go DDR5",
  category: "Gaming",
  os: "Windows",
  price: 15,
  description: "Amazing gaming laptop! Can run any game with ease, powerful and lightweight, the perfect computer for gamers who are on the move.",
  user: User.create!(
    first_name: "Johann",
    last_name: "Artis",
    email: "artis@realmail.com",
    address: "Sarphatistraat 91, 1018 EZ Amsterdam",
    password: "password"
  )
)
file = File.open("app/assets/images/pc-msi-1.jpeg")
file2 = File.open("app/assets/images/pc-msi-2.jpeg")
file3 = File.open("app/assets/images/pc-msi-3.jpeg")
msi.photos.attach(io: file, filename: "msi.jpeg", content_type: "image/jpg")
msi.photos.attach(io: file2, filename: "msi2.jpeg", content_type: "image/jpg")
msi.photos.attach(io: file3, filename: "msi3.jpeg", content_type: "image/jpg")
msi.save!

alien = Computer.new(
  brand: "Alienware",
  model: "m15",
  year: 2019,
  screen_size: "15.6",
  processor: "Processeur Intel® Core™ i7-12700H ",
  ram: "16 Go, 2 x 8 Go de mémoire DDR5 bicanale à 4 800 MHz",
  storage: "512 Go",
  category: "Gaming",
  os: "Windows",
  price: 12,
  description: "An afffordable gaming PC that is lightweight and easy to carry, with a lightning-fast Intel processor and state-of-the-art graphics. Have fun!",
  user: User.create!(
    first_name: "Chris",
    last_name: "Hunter",
    email: "chrisX@realmail.com",
    address: "Van Hogendorpstraat 159-121, 1051 GA Amsterdam",
    password: "password"
  )
)
file = File.open("app/assets/images/pc-alienware-1.jpeg")
file2 = File.open("app/assets/images/pc-alienware-2.jpeg")
alien.photos.attach(io: file, filename: "alien.jpeg", content_type: "image/jpg")
alien.photos.attach(io: file2, filename: "alien2.jpeg", content_type: "image/jpg")
alien.save!

surface = Computer.new(
  brand: "Surface",
  model: "Pro 8",
  year: 2022,
  screen_size: "13",
  processor: "Processeur Intel® Core™ 11e",
  ram: "4 Go",
  storage: "128 Go",
  category: "Entertainment",
  os: "Windows",
  price: 9,
  description: "Surface Pro 8 is designed to bring out the best in Windows 11 and lets you work, play, and create your own way. Works as a laptop, tablet, or as portable digital media. It's up to you, it's your computer!",
  user: User.create!(
    first_name: "James",
    last_name: "Crocker",
    email: "crocker@realmail.com",
    address: "Van Hogendorpstraat 159-121, 1051 GA Amsterdam",
    password: "password"
  )
)
file = File.open("app/assets/images/pc-surface.jpeg")
surface.photos.attach(io: file, filename: "surface.jpeg", content_type: "image/jpg")
surface.save!

dell = Computer.new(
  brand: "Dell",
  model: "Latitude 5431",
  year: 2020,
  screen_size: "14",
  processor: "12th Gen Intel® Core™ i7-1270P",
  ram: "16 GB",
  storage: "512 Go",
  category: "Development",
  os: "Windows",
  price: 12,
  description: "Work anywhere in the world with the industry's smartest and most secure business PC with built-in AI.",
  user: User.create!(
    first_name: "Lesley",
    last_name: "Hunter",
    email: "lesley@realmail.com",
    address: "Van Hogendorpstraat 159-121, 1051 GA Amsterdam",
    password: "password"
  )
)
file = File.open("app/assets/images/pc-dell.jpg")

dell.photos.attach(io: file, filename: "dell.jpg", content_type: "image/jpg")
dell.save!

lenovo = Computer.new(
  brand: "Lenovo",
  model: "Legion 5i Pro 16",
  year: 2018,
  screen_size: "13,3",
  processor: "Processeur Intel® Core™ i5-12500H 12e génération",
  ram: "32 Go (2 x 16 Go) SO-DIMM DDR5 4800MHz",
  storage: "512 Go SSD M.2 2242",
  category: "Data Science",
  os: "Windows",
  price: 15,
  description: "This is a great laptop for writing heavy programs while traveling. Doesn't lack processing power or battery life.",
  user: User.create!(
    first_name: "Gabrielle",
    last_name: "Jones",
    email: "gabby@realmail.com",
    address: "Van Hogendorpstraat 159-121, 1051 GA Amsterdam",
    password: "password"
  )
)
file = File.open("app/assets/images/pc-lenovo.jpeg")
lenovo.photos.attach(io: file, filename: "lenovo.jpeg", content_type: "image/jpg")
lenovo.save!

asus = Computer.new(
  brand: "Asus",
  model: "Zenbook EVO-UX325",
  year: 2021,
  screen_size: "13",
  processor: "Intel Core i5",
  ram: "16 Go",
  storage: "512 Go SSD",
  category: "Photo-Editing",
  os: "Windows",
  price: 15,
  description: "This ASUS laptop with OLED display features the best colors and visuals in its class. It reproduces every color with stunning fidelity for true-to-life rendering and professional quality images.",
  user: User.create!(
    first_name: "Michael",
    last_name: "Baynes",
    email: "baynes@realmail.com",
    address: "Van Hogendorpstraat 159-121, 1051 GA Amsterdam",
    password: "password"
  )
)
file = File.open("app/assets/images/pc-asus.jpeg")
asus.photos.attach(io: file, filename: "asus.jpeg", content_type: "image/jpg")
asus.save!

puts "Done!"
