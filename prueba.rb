def menu
  system('clear')
  puts "____________PRUEBA RUBY SEBASTIAN FUENZALIDA (Sorry por no Refactorizar)_______"
  puts "SELECCIONA UNA OPCION"
  puts "[1] Generar un Archivo con nombres y promedios"
  puts "[2] Muestra inasistencias totales en pantalla"
  puts "[3] Muestra los alumnos aprobados"
  puts "[4] Salir"
  puts "_______________________________________________________________________________"
end

menu
opcion = gets.chomp.to_i
lines = []
File.open('data.csv', 'r') { |file| lines = file.readlines }

while opcion != 4

    case opcion  # probar las opciones
    when 1       # Generar un Archivo con nombres y promedios
      arr = []
      lines.each do |line|
          arr.push(line.split(', '))
      end
      notas = []
      nombres = []
      arr.each do |nota|
        notas.push((nota[1].to_i + nota[2].to_i + nota[3].to_i + nota[4].to_i + nota[5].to_i)/5.to_f)
      end
      arr.each do |nombre|
        nombres.push(nombre[0])
      end
      #print arr[3] #["JP", "10", "10", "10", "10", "10\n"]
      promedios = nombres.zip(notas)
      print "Se ha generado el archivo promedios.csv con la siguiente info: #{promedios}"
      # [["David", 3.6], ["Gonzalo", 4.2], ["Mai", 7.6], ["JP", 10.0]]

      archivo = File.open('promedios.csv', 'w')
          archivo.puts "[Nombre,Promedio]"  # NO supe como hacer el archivo como tabla :/
          promedios.each do |promedio|
            archivo.puts "#{promedio}"
          end
      archivo.close


      gets
      menu
      opcion = gets.chomp.to_i

    when 2       # Muestra inasistencias totales en pantalla
      arr = []
      lines.each do |line|
          arr.push(line.split(', '))
      end

      puts "Inasistencias totales del curso: #{arr[0].count{|i| i == "A" || i =="A\n"} + arr[1].count{|i| i == "A" || i =="A\n"} + arr[2].count{|i| i == "A" || i =="A\n"} + arr[3].count{|i| i == "A" || i =="A\n"}}"
      puts  "#{arr[0][0]} tuvo #{arr[0].count{|i| i == "A" || i =="A\n"}} inasistencias"
      puts  "#{arr[1][0]} tuvo #{arr[1].count{|i| i == "A" || i =="A\n"}} inasistencias"
      puts  "#{arr[2][0]} tuvo #{arr[2].count{|i| i == "A" || i =="A\n"}} inasistencias"
      puts  "#{arr[3][0]} tuvo #{arr[3].count{|i| i == "A" || i =="A\n"}} inasistencias"
      gets
      menu
      opcion = gets.chomp.to_i

    when 3       # Muestra los alumnos aprobados
      def aprobados(z=5)
        lines = []
        File.open('data.csv', 'r') { |file| lines = file.readlines }
        arr = []
        lines.each do |line|
            arr.push(line.split(', '))
        end
        notas = []
        nombres = []
        arr.each do |nota|
          notas.push((nota[1].to_i + nota[2].to_i + nota[3].to_i + nota[4].to_i + nota[5].to_i)/5.to_f)
        end
        arr.each do |nombre|
          nombres.push(nombre[0])
        end
        #print arr[3] #["JP", "10", "10", "10", "10", "10\n"]

        # [["David", 3.6], ["Gonzalo", 4.2], ["Mai", 7.6], ["JP", 10.0]]
        promedios = nombres.zip(notas)
        return promedios.select{ |x| x[1] > z}
      end
      aprueban = aprobados()
      print "Alumnos aprobados: #{aprueban}"
      gets
      menu
      opcion = gets.chomp.to_i

    else
      puts "Esa opción no es válida, presiona cualquier tecla para continuar"
      gets
      menu
      opcion = gets.chomp.to_i
    end

end # Fin del While
