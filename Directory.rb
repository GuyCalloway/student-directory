
students = [
 "Dr. Hannibal Lecter",
 "Darth Vader",
 "Nurse Rathed",
 "Michael Corleone",
 "Alex Delarge",
 "The WicKed Witch of the the West",
 "Terminator",
 "Freddy Krueger",
 "The Joker",
 "Joffrey Baratheon",
 "Norman Bates"
]

def print_header
  puts "The students of the Villains Academy"
  puts "--------------"
end
def print(names)
  names.each do |name|
    puts name
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)
