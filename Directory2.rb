
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
students
end

def add_details(students)
  i = 0
  x = ""
  while x != "stop"
    puts "Press Enter to continue adding information, or stop to complete directory"
    x = gets.chomp
    if x == ""
      students.each_with_index { |x, i| puts "#{x.fetch(:name)}'s xtra info key"
        k = gets.chomp
        puts "value, press L to add list"
        v = gets.chomp
        if v != "L"
          students[i][k] = v
        elsif v == "L"
          puts "enter #{k}'s' one by one, then \'complete\' "
          t = ""
          j = []
          until t == "complete"
            t = gets.chomp
            j << t
          end
          students[i][k] = j
        end
}
    else
    end
  end
  return students
end

def print_header
  puts "The students of the Villains Academy"
  puts "--------------"
end

def print(students)
  i = 0
  while i < students.count
      puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)"
      i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
add_details(students)
print_header
print(students)
print_footer(students)