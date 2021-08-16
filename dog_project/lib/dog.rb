class Dog
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def bark
        if @age > 3
            @bark.upcase
        else
            @bark.downcase
        end
    end

    def favorite_foods
        @favorite_foods
    end

    def age=(num)
        @age = num
    end

    def favorite_food?(str)
        @favorite_foods.each do |food|
            if food.downcase == str.downcase
                return true
            end
        end
        return false
    end
end
