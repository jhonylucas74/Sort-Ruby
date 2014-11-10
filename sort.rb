# BUBLE SORT
#=================================================
def bubble_sort(list)
  return list if list.size <= 1 # already sorted
  swapped = true
  while swapped do
    swapped = false
    0.upto(list.size-2) do |i|
      if list[i] > list[i+1]
        list[i], list[i+1] = list[i+1], list[i] # swap values
        swapped = true
      end
    end    
  end

  list
end

# MERGE SORT
#=================================================
def mergesort(list)
  return list if list.size <= 1
  mid = list.size / 2
  left  = list[0, mid]
  right = list[mid, list.size-mid]
  merge(mergesort(left), mergesort(right))
end

def merge(left, right)
  sorted = []
  until left.empty? or right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted.concat(left).concat(right)
end

# Calculando diferença dp tempo
def time_diff(start_time, end_time)
 "%0.5f" % ( end_time - start_time )
end

lista = []
r = Random.new

# tamanho da lista
print "Digite o tamanho total da lista :"
tamanho = gets.chomp.to_i

# Prechendo o array
puts " prechendo o array.."
for i in 1..tamanho
  lista.push r.rand(1...tamanho)
end

# Ordenando 
puts "Digite 1 para utilizar o Buble Sort"
puts "Digite 2 para utilizar o Merge Sort"
type = gets.chomp.to_i

if type == 1
  puts " Ordenando a parada..."
  start = Time.now
  lista = bubble_sort(lista)
  finish = Time.now
elsif type.to_i == 2
  puts " Ordenando a parada..."
  start = Time.now
  lista = mergesort(lista)
  finish = Time.now
else
   puts "Execução cancelada. A opção escolhida não é válida."
end

# imprimindo resultados
time = time_diff(start,finish)
puts " ------------------------------------"
puts " Feito em " + time + " segundos \n"
puts " primeira posição #{lista[0]}, ultima posição #{lista[tamanho-1]}"
puts " ------------------------------------"