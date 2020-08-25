# let's put all students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
  ]



def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print(students)
students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_loop(students)
num = 0
  while num < students.size do
    puts students[num][:name]
    num += 1
  end
end

def print_by_name(students)
puts "Which students Last Name first letter do you want displayed?"
letter_input = gets.chomp
students.each_with_index do |student, index|
    if letter_input == student[:name].split(' ').last.chr
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_names_shorter_than_twelve(students)
puts "Here is a list of students whose last name is shorter than 12 characters?"
students.find_all do |student| 
  if student[:name].split(' ').last.size < 12
    puts student[:name]
  end
end

def print_count(names)
puts "Overall, we have #{names.count} great students"
end

def input_students
puts "Please enter a name of the students"
puts "To finish, just hit return twice"
# creates an empty array
students = []
# get the first name
name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
# return the array of students
students
end


#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_count(students)