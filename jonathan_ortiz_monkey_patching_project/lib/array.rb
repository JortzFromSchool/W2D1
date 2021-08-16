# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.length == 0
            return nil
        else
            largest = self.sort[-1]
            smallest = self.sort[0]
            return largest - smallest
        end
    end

    def average
        if self.length == 0
            return nil
        else
            return self.sum.to_f / self.length
        end
    end

    def median
        if self.length == 0
            return nil
        elsif self.length % 2 == 0
            #even number of elems
            return (self.sort[self.length/2] + self.sort[(self.length/2) - 1]).to_f / 2
        else
            #odd number of elems
            return self.sort[(self.length-1)/2]
        end
    end

    def counts
        counted = Hash.new(0)
        self.each do |num|
            counted[num] += 1
        end
        return counted
    end

    def my_count(value)
        counts = self.counts
        return counts[value]
    end

    def my_index(value)
        if !self.include?(value)
            return nil
        else
            self.each_with_index do |num, idx|
                if num == value
                    return idx
                end
            end
        end
    end

    def my_uniq
        uniq = []
        self.each do |elem|
            if !uniq.include?(elem)
                uniq << elem
            end
        end
        return uniq
    end

    def my_transpose
        results = []
        #fill inner with initial values
        (self.length).times do
            inner = []
            self[0].length.times do
                inner << 0
            end
            results << inner
        end

        self.each_with_index do |outer_elem, outer_index|
            outer_elem.each_with_index do |inner_elem, inner_index|
                results[inner_index][outer_index] = inner_elem
            end
        end

        results
    end
end
