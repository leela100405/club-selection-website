# Clearly labelled fictional sample records for the professor demonstration.
Registration.delete_all
names = ["Aarav Sharma", "Aanya Reddy", "Aditya Rao", "Anika Patel", "Arjun Kumar", "Diya Singh", "Ishaan Verma", "Kavya Nair", "Meera Das", "Rohan Gupta", "Saanvi Joshi", "Vihaan Mehta", "Zara Khan", "Nikhil Rao", "Priya Menon", "Rahul Iyer", "Sneha Paul", "Kiran Reddy", "Tanvi Shah", "Dev Malhotra"]
clubs = Registration::CLUBS
70.times do |i|
  Registration.create!(student_name: "#{names[i % names.length]}#{i >= names.length ? " #{i / names.length + 1}" : ""}", student_class: "B.Tech 4th Year", section: ["A", "B"][i % 2], email: "student%02d@example.edu" % (i + 1), club: clubs[(i * 3 + i / 7) % clubs.length])
end
