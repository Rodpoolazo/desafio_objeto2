# Crear una clase Table cuyo constructor reciba el nombre de la mesa y las recaudaciones correspondientes de cada día.

class Table
  attr_reader :name, :recaudaciones
  def initialize(name, *recaudaciones) # "*" = splat => agupa la recaudacion y los separa del name
    @name = name
    @recaudaciones = recaudaciones.map(&:to_i) # a c/u de los elementos los convierte en Integers
  end

  def average
    @recaudaciones.inject(&:+)/@recaudaciones.size.to_f
  end


 def recaudacion_max
   @recaudaciones.max
 end

end
  file = File.open('casino.txt', 'r')
  data = file.readlines
  file.close

  tables = []
  data.each do |line|
    ls = line.split(', ')
    tables << Table.new(*ls)
  end

  # promedio de recaudacion total recaudado por todas las mesas en todos los dias
averages = tables.map(&:average)
puts averages.inject(:+) /averages.size

  #muestra el total recaudado x dia del total de mesas
tables[0].recaudaciones.size.times do |i|
  puts tables.inject(0) {|sum, table| sum + table.recaudaciones[i]} # el [0] es solo para partir la suma
end

  # muestra el promedio recaudado por mesa
  tables.each do |table|
    puts table.name
    puts table.average
  end

# muestra la recuadacion Mayor de cada mesa
  tables.each do |table|
  puts table.name
  puts table.recaudacion_max
end
