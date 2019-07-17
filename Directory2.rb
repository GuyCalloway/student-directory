def studentcounter(x, count)
  if count == 1
    x.sub! 'students', 'student'
  else
    x
  end
end

def input_students
  puts "Please enter the names of the students, press enter to add cohorts"

  students = []
  name = gets.chomp

  while !name.empty? do
    students << {name: name}
    str = "Now we have #{students.count} students"
    puts studentcounter(str, students.count)
    name = gets.chomp
  end

   students.each_with_index { |x, i| puts "please enter cohort of student #{x.fetch(:name)}"
     n = gets.chomp
     n = month_checker(n, x.fetch(:name))
     k = :cohort
     students[i][k] = n.to_sym
   }

  students

end

def month_checker(n, name)
    months = [
'January',
'February',
'March',
'April',
'May',
'June',
'July',
'August',
'September',
'October',
'November',
'December'
]

  months_lowercase = []
  months.each { |x| months_lowercase << x.downcase }
  until months.include? n or months_lowercase.include? n
    if !n.empty?
      puts "unrecognised, please enter the month student #{name} started"
      n = gets.chomp
    elsif n.empty?
      puts "Empty string detected, press enter again for default value or enter month cohort student joined"
      n = gets.chomp
      if n == ""
        puts "default value assigned"
        n = "January"
      end
    end
  end
  return n.capitalize
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
  str = "Overall, we have #{names.count} great students\n"
  puts studentcounter(str, names.count).center(36)

end

students = input_students
add_details(students)
print_header
print(students)
print_footer(students)
