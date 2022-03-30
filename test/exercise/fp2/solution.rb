module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        i = 0
        while i < length
          yield self[i]
          i += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map(&blk)
        result = []
        my_each { |el| result << blk.call(el) }
        MyArray.new(result)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = []
        my_each { |el| result << el unless el.nil? }
        MyArray.new(result)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &blk)
        array = dup
        acc = array.shift if acc.nil?

        array.my_each do |el|
          acc = blk.call(acc, el)
        end

        acc
      end
    end
  end
end
