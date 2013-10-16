# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Fraccion

require "./racional.rb"
require "test/unit"

class Test_Fraccion < Test::Unit::TestCase
	def test_suma
		assert_equal(Fraccion.new(203,15), Fraccion.new(13,3).suma(Fraccion.new(46,5)))
	end

	def test_resta
		assert_equal(Fraccion.new(-73,15), Fraccion.new(13,3).resta(Fraccion.new(46,5)))
	end

	def test_producto
		assert_equal(Fraccion.new(598,15), Fraccion.new(13,3).producto(Fraccion.new(46,5)))
	end

	def test_division
		assert_equal(Fraccion.new(65,138), Fraccion.new(13,3).division(Fraccion.new(46,5)))
	end
end
