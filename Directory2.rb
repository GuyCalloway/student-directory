
def input_students
  puts "Please enter the names of the students, enter to move on"

  students = []
  name = gets.chomp

  while !name.empty? do
    students << {name: name}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

   students.each_with_index { |x, i| puts "please enter cohort of student #{x.fetch(:name)}"
     n = gets.chomp.to_sym
     k = :cohort
     students[i][k] = n
   }

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
  puts "\nThe students of the Villains Academy"
  puts "--------------".center(36)
end

def print(students)
  i = 0
  while i < students.count
      puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)".center(36)
      i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students\n".center(36)
end

students = input_students
add_details(students)
print_header
print(students)
print_footer(students)
