require "sinatra"
require "sinatra/reloader" # enables automatic reloading of code

# Better error messages
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

# Homepage
get("/") do
  erb(:elephant)
# Replaced with template above
#   "<h1>Hello Dice World</h1>
  
#   <ul>
#     <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
#     <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
#     <li><a href=\"/dice/1/20\">Roll one 20-sided dice</a></li>
#     <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
#   </ul>"
# # why the =\ in the href? - add the backslashes to enable you to write code outside the string. Necessary in Ruby
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

# Roll 2 6-sided dice

get("/dice/2/6") do
    first_die = rand(1..6)
    second_die = rand(1..6)
    sum = first_die + second_die

    @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

    erb(:two_six)
    # "<h1>2d6</h1>
    # <p>#{outcome}</p>
    # <p><a href=\"/\">Home</a></p>"
end

# Roll 2 10-sided dice
get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_ten)
  # "<h1>2d10</h1>
  # <p>#{outcome}</p>
  # <p><a href=\"/\">Home</a></p>"

end

# Roll 1 20-sided dice

get("/dice/1/20") do
  @die = rand(1...20)

  @outcome = "You rolled a #{@die} on a 20-sided dice."

  erb(:one_twenty)
  # "<h1>1d10</h1>
  # <p>#{outcome}</p>
  # <p><a href=\"/\">Home</a></p>"
end

# Roll 5 4-sided dice
get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die

  @outcome = "You rolled a #{first_die}, #{second_die}, #{third_die}, #{fourth_die}, and #{fifth_die} for a total of #{sum}."

  erb(:five_four)
  # "<h1>5d4</h1>
  # <p>#{outcome}</p>
  # <p><a href=\"/\">Home</a></p>"

end

# Roll 100 6-sided dice

get("/dice/100/6") do
  @rolls = [] # Create a blank array
  100.times do    # 100 times...
    die = rand(1..6)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  erb(:one_hundred_six)
end
