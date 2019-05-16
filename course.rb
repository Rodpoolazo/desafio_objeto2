#
#Crear una clase Course cuyo constructor reciba el nombre del curso y las fechas de inicio y término.
#Crear un método que permita leer el archivo y crear una instancia de la clase Course por línea del archivo.
#Crear métodos que permitan:
#Saber qué cursos comienzan previo a una fecha entregada como argumento. Saber qué cursos finalizan posterior a una fecha entregada como argumento.
#En ambos el métodos argumento por defecto debe ser la fecha de hoy.
#Ambos métodos deben levantar una excepción si la fecha recibida es >= 2018-01-01.

require 'date'

class Course
  attr_reader :name, :fechas_clases
  def initialize(name, *fechas_clases)
    @name = name
    @fechas_clases = fechas_clases.map {|date| Date.parse(date)}
  end

  def fechas_clases_before(filter_date)
    raise ArgumentError.new('argument is not a date') if filter_date.class != Date
    @fechas_clases.select {|date| date < filter_date}
  end

  def fechas_clases_after(filter_date)
    raise ArgumentError.new('argument is not a date') if filter_date.class != Date
    @fechas_clases.select {|date| date > filter_date}
  end




end

file = File.open('cursos.txt', 'r')
data = file.readlines
file.close

courses = []
data.each do |line|
  ls = line.split(', ')
  courses << Course.new(*ls)


end

courses.each do |course|
puts course.name
print courses[1].fechas_clases_before(Date.today) #muestras las fechas anteriores de hoy
end
