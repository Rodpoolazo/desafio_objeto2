# Se tiene un array que contiene los números de una ruleta.

#r = (1..10).to_a
#Se pide:
#Crear una clase llamada Roulette.
#Crear un método de instancia llamado play que reciba como argumento un número al cual se está apostando. Luego debe tomar un valor -del array- al azar y compararlo con el número al cual se apostó.
#Crear un método de instancia que:
#Debe almacenar el número generado al azar en un archivo llamado
#         roulette_history.txt
#Si el número al cual se apostó corresponde al generado al azar entonces, debe además
#almacenar ese número en un archivo llamado t
#Crear un método que lea el archivo y retorne el valor que más ha generado la ruleta históricamente.

r = (1..10).to_a

class Roulette
   attr_reader :r
  def initialize(r)
    @r = r.map.(&:to_i)
  end

    def play(apuesta)
     puts "Apuesta en la Ruleta, elije un numero: "
     apuesta = gets.chomp.to_i
     jugador1 = ""
    puts 'Jugador1 elije #{apuesta}'
    
     ruleta << Roulette.new(rand(@r))
     if apuesta != ruleta
       puts "no ganaste"
     else
       "ganaste, salio tu apuesta"
       winners=[]
    end
  end
    end
    def historica
        
    
    end

    ruleta_historica = File.write('roulette_history.txt', ruleta.join("\n")) # crea un archivo con los numeros que se van generando

    aciertos = File.write('winners.txt' , winners.join("\n"))
