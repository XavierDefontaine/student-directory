# let's put all students into an array
=begin
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, nationality: :french},
  {name: "Darth Vader", cohort: :november, nationality: :british},
  {name: "Nurse Ratched", cohort: :november, nationality: :french},
  {name: "Michael Corleone", cohort: :november, nationality: :british},
  {name: "Alex DeLarge", cohort: :november, nationality: :italian},
  {name: "The Wicked Witch of the West", cohort: :november, nationality: :spanish},
  {name: "Terminator", cohort: :november, nationality: :french},
  {name: "Freddy Krueger", cohort: :november, nationality: :british},
  {name: "The Joker", cohort: :november, nationality: :american},
  {name: "Joffrey Baratheon", cohort: :november, nationality: :brazilian},
  {name: "Norman Bates", cohort: :november, nationality: :romanian}
  ]
=end 

def print_loop(students)
num = 0
  while num < students.size do
    puts students[num][:name]
    num += 1
  end
end

def print_by_name(students)
puts "Which students Last Name first letter do you want displayed?"
letter_input = gets.delete("
")
students.each_with_index do |student, index|
    if letter_input == student[:name].split(' ').last.chr
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort, from #{student[:nationality]})"
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
end

def input_students
puts "Please enter a name of the students"
puts "To finish, just hit return twice"
# creates an empty array
students = []
# get the first name
name = gets.delete("\n").downcase.capitalize
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "which cohort?"
    cohort = gets.delete("\n").capitalize
    if cohort.empty?
    cohort = "november"
    end
    puts "which nationality?"
    nationality = gets.delete("\n").downcase.capitalize
    students << {name: name, cohort: cohort.to_sym, nationality: nationality.to_sym}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.delete("\n")
  end
# return the array of students
students
end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print(students)
students.each_with_index do |student, index|
  puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort, from #{student[:nationality]})".center(30)
  end
end

def print_by_cohort(students)
  cohort_list = students.map { |student| student[:cohort].capitalize }.uniq
puts "Which cohort from the list?"
puts "#{cohort_list} \n"
  cohort_month = gets.delete("
").capitalize.to_sym
puts "Ok, here are all the students from #{cohort_month}"
  students.each_with_index do |student, index|
    if cohort_month == student[:cohort]
      puts "#{student[:name]}"
    end
  end
end


def print_count(students)
puts "Overall, we have #{students.count} great student" 
+ "s" if students.count > 1
end


#nothing happens until we call the methods
students = input_students
print_header
print_by_cohort(students)
print_count(students)