
def input_students
  puts "Please enter the names of the students"
  puts "press return twice to stop"

# Add more information: hobbies, country of birth, height, etc.
  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

  i = 0
  while i < students.count
    x = "c"
    while !x.empty? do
      puts "To Enter Student details, Enter name, press enter to move to next student"
      x = gets.chomp


    end
end
end

def add_details(students)
  i = 0
  while i < students.count
    puts "Enter category for #{students[i][:name]}'s additional info"
    x = gets.chomp
    puts "Enter information"
    y = gets.chomp
    students[i][x.to_sym] = y
    i += 1
  end

  students
end

def print_header
  puts "The students of the Villains Academy"
  puts "--------------"
end

def print(students)
  i = 0
  p students
  while i < students.count
      puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)"
      i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
