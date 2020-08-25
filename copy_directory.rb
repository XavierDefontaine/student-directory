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

def print_by_cohort(students)
  cohort_list = students.map { |student| student[:cohort].capitalize }.uniq
puts "Which cohort from the list?"
puts "#{cohort_list} \n"
  cohort_month = gets.delete("\n").capitalize.to_sym
puts "Ok, so here are all the students from #{cohort_month}"
  students.each_with_index do |student, index|
    if cohort_month == student[:cohort]
      puts "#{student[:name]}"
    end
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
@students = []

def input_students
puts "Please enter a name of the students"
puts "To finish, just hit return twice"
name = gets.delete("\n").downcase.capitalize
  while !name.empty? do
    puts "which cohort?"
    cohort = gets.delete("\n").capitalize
    if cohort.empty?
    cohort = "november"
    end
    puts "which nationality?"
    nationality = gets.delete("\n").downcase.capitalize
    @students << {name: name, cohort: cohort.to_sym, nationality: nationality.to_sym}
    puts "Now we have #{@students.count} students"
    name = gets.delete("\n")
  end
end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print_student_names
@students.each_with_index do |student, index|
  puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort, from #{student[:nationality]})".center(30)
  end
end

def print_count
puts "Overall, we have #{@students.count} great student" 
+ "s" if @students.count > 1
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
  puts "9. Exit" # 9 because we'll be adding more items  
end

def show_students
  print_header
  print_student_names
  print_count
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

interactive_menu