# Implementar en este fichero la clase para crear objetos racionales

require "./gcd.rb"

class Fraccion
	attr_accessor :n, :d

	def initialize(n,d)
		@n, @d = n, d
	end

   def to_s
      "#{@n}/#{@d}"
   end

   def reducir(n,d)
   	mcd = gcd(n,d)
   	Fraccion.new(n/mcd, d/mcd)
   end

   def sumayresta(other,f1,f2)
   	if f1.d != f2.d then
   		mcm = (f1.d * f2.d) / gcd(f1.d,f2.d)
   		f1.n = mcm / f1.d * f1.n
   		f1.d = mcm
   		f2.n = mcm / f2.d * f2.n
   		f2.d = mcm
   	end
   end

   def suma(other)
   	f1 = reducir(@n,@d)
   	f2 = reducir(other.n, other.d)
   	sumayresta(other,f1,f2)
   	ff = Fraccion.new(f1.n + f2.n, f1.d)
   	reducir(ff.n,ff.d)
   end

   def resta(other)
   	f1 = reducir(@n,@d)
   	f2 = reducir(other.n, other.d)
   	sumayresta(other,f1,f2)
   	ff = Fraccion.new(f1.n - f2.n, f1.d)
   	reducir(ff.n,ff.d)
   end

   def producto(other)
      f1 = reducir(@n,@d)
   	f2 = reducir(other.n, other.d)
      ff = Fraccion.new(f1.n * f2.n, f1.d * f2.d)
      reducir(ff.n,ff.d)
   end

   def division(other)
   	f1 = reducir(@n,@d)
   	f2 = reducir(other.n, other.d)
      ff = Fraccion.new(f1.n * f2.d, f1.d * f2.n)
      reducir(ff.n,ff.d)
   end

   def ==(other)
   	return @n == other.n && @d  == other.d if other.instance_of? Fraccion
   	false
   end
end

a = Fraccion.new(13,3)
b = Fraccion.new(46,5)
c = a.suma(b)
puts c.to_s
d = a.resta(b)
puts d.to_s
e = a.producto(b)
puts e.to_s
f = a.division(b)
puts f.to_s