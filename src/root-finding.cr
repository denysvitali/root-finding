require "./root-finding/*"
require "io/console"

module RootFinding
  puts "Root finding algorithm"

  puts "Function is f(x) = x^2-3"

  eps = 1E-10

  puts "Bisection: "
  puts "Insert a:"
  begin
    a = Float64.new(STDIN.read_line)
  rescue ex1 : ArgumentError
    puts "Invalid input"
    exit
  end

  puts "Insert b:"

  begin
    b = Float64.new(STDIN.read_line)
  rescue ex1 : ArgumentError
    puts "Invalid input"
    exit
  end
  puts "-----"
  bisection(a, b, eps)
end

def f(x : Float64)
  x**2 - 3
end

def bisection(a : Float64, b : Float64, eps : Float64, it : Int32 = 0)
  it +=1
  c = (a + b)/2
  if (f(c).abs <= eps)
    puts "End, #{it} iteractions"
    puts "Found a zero at #{c}: f(c) = #{f(c)} =~ #{Math.sqrt(3)}"
    return
  end
  if (f(a)*f(c) < 0)
    bisection(a, c, eps, it)
  else
    bisection(b, c, eps, it)
  end
end
