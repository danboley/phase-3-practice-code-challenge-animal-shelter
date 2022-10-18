class Pet < ActiveRecord::Base

    :belongs_to :shelter
    :belongs_to :adopter

    def self.oldest
        self.all.max_by do |pet|
            pet.age
        end
    end

    def self.average_age
        Pet.all.sum(:age) / Pet.all.count.to_f
    end

    def in_dog_years
        if self.speicies.downcase == "dog"
            self.age * 5
        else
            "This is not a dog..."
        end
    end

end
