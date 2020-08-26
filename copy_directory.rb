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

@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
  student_data = [student[:name], student[:cohort]]
  csv_line = student_data.join(",")
  file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu