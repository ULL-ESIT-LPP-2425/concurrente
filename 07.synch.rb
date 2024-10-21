def inc(n)
  n + 1
end

mutex = Mutex.new

threads = []
sum = 0
i = 1
while i <= 10 do 
  threads[i] =  Thread.new do
     j = 1
     while j <= 10_000 do
        mutex.synchronize do
          sum = inc(sum)
        end
        j = j + 1
     end
   end
   i = i + 1
end

i = 1
while i <= 10 do 
 threads[i].join
 i = i + 1
end

p sum
