require 'csv'

@students = Array.new

def try_load_students
  filename = ARGV.first || "students.csv"
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def add_students_to_array
@students << {name: @name, cohort: @cohort.to_sym}
end

def input_student
  puts "\nPlease enter the names of the students"
  puts "To finish, just hit return twice"
  @name = STDIN.gets.chomp
  while !@name.empty? do
    print "cohort? "
    @cohort = STDIN.gets.chomp
    add_students_to_array
    puts "Now we have #{@students.count} students.\n"
    print "You can add another if you like: "
    @name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "\n1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students"
  puts "4. Load students from specific file"
  puts "9. Exit" 
end

def show_students
  print_header
  print_student_list
  print_footer
end

def load_students(filename = "students.csv")
return puts "file doesn't exist" if !File.exist?(filename)
if !filename.empty?
  @students = []
  CSV.foreach(filename) do |row|
  @name, @cohort = row
  add_students_to_array
 end
  puts "Loaded #{@students.count} student files from #{filename}"
end
end

def save_students(filename)
  CSV.open(filename, "w") do |file| 
  @students.each do |student| 
  file << [student[:name], student[:cohort]]
  end
 end
end

def process(selection)
  case selection
  when "1"
    input_student
  when "2"
    show_students
  when "3"
    puts "What do you want the file called?"
    save_students(gets.chomp)
    puts "All saved for you.\n"
  when "4"
    puts "Please enter file to load students from?"
    load_students(gets.chomp)
  when "9"
    exit 
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "\nThe students of Villains Academy"
  puts "---------------------------------"
end

def print_student_list
  @students.each do |student|
    puts "      #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students.\n"
end

try_load_students
interactive_menu