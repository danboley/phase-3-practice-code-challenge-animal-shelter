class Adopter < ActiveRecord::Base

    :has_many :pets
    :has_many :shelters, through: :pets

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def adopt(pet)
        if !pet.adopted? && !pet.adopter_id
            pet.update(adopted?: true, adopter_id: self.id)
        end
    end

    def fav_pet
        return nil if self.pets.count == 0

        self.pets
        .group_by do |pet|
            pet.species
        end
        .max_by do |species|
            species.count
        end
        [0]
    end

end
