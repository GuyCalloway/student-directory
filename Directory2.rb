

@months = [
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

@monthsindex = @months.each {|x| x.to_sym}
@months_lowercase = @months.each { |x| x.downcase }

def studentcounter(x, count)
  if count == 1
    x.sub! 'students', 'student'
  else
    x
  end
end

def input_students
  puts "Please enter the names of the students, press enter to add cohorts"

  @students = []
  name = gets.chomp

  while !name.empty? do
    @students << {name: name}
    str = "Now we have #{@students.count} students"
    puts studentcounter(str, @students.count)
    name = gets.chomp
  end

   @students.each_with_index { |x, i| puts "Please enter cohort of student #{x.fetch(:name)}"
     n = month_checker(gets.chomp, x.fetch(:name))
     k = :cohort
     @students[i][k] = n.to_sym
   }

  add_details
end




def month_checker(n, name)
  until @months.include? n or @months_lowercase.include? n
    if !n.empty?
      puts "Unrecognised, please enter the month student #{name} started"
      n = gets.chomp
    elsif n.empty?
      puts "Empty string detected, press enter again for default value or enter month cohort student joined"
      n = gets.chomp
      if n == ""
        puts "Default value assigned"
        n = "January"
      end
    end
  return n.capitalize
end
end

def print_details_option(i)
  if i == 0
    puts "Press Enter to add additional categories and information.\nType \'stop\' to complete directory"
  else
    puts "Press Enter to continue adding categories and information \nType \'stop\' to complete directory"
  end
end

def add_details
  i = 0
  x = ""
  while x != "stop"
    print_details_option(i)
    x = gets.chomp
    i+=1

    if x == ""
      @students.each_with_index { |x, i| puts "#{x.fetch(:name)}'s xtra info key"
        k = gets.chomp
        puts "value, press L to add list"
        v = gets.chomp
        if v != "L"
          @students[i][k] = v
        elsif v == "L"
          puts "enter #{k}'s' one by one, then \'complete\' "
          t = ""
          j = []
          until t == "complete"
            t = gets.chomp
            j << t
          end
          @students[i][k] = j
        end
}
    else
    end
  end
  @students
end

def print_header
  puts "\nThe students of the Villains Academy"
  puts "--------------".center(36)
end

@monthsindex = [:January,
:February,
:March,
:April,
:May,
:June,
:July,
:August,
:September,
:October,
:November,
:December
]

def print_students_list
    studentsordered = @students.group_by { |d| d[:cohort] }
    studentsordered.sort_by { |x, v| @monthsindex.index x }.each { |x, v| puts "Cohort: #{x}".center(36)
      v.each { |x| puts x[:name].center(36)
              }
            }
end

def print_footer
  if @students.count == 0
      puts "There are no students in the Academy\n"
  else
      str = "Overall, we have #{@students.count} great students\n"
      puts studentcounter(str, @students.count).center(36)
  end
end

def print_menu
  puts "\n1. Input the students\n2. Show the students\n9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    show_extras
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  @students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu

# students = input_students

# print_header
# print(students)
# print_footer(students)
