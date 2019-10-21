class PlantPlaceholder

    attr_accessor :common_name, :scientific_name, :id, :image
    

    def self.mass_create_from_hash(res)
        all_searched_plants = res.map do |p|
            searched_plants = {}
            searched_plants[:common_name] = p["common_name"]
            searched_plants[:scientific_name] = p["scientific_name"] 
            searched_plants[:id] = p["id"]
            searched_plants
        end 
    return all_searched_plants 
    end

    def self.new_from_hash(hash)
       self.new(hash[:common_name], hash[:scientific_name], hash[:id])
    end

    def self.new_from_hash_with_image(hash)

    end

    def initialize(common_name, scientific_name, id)
        @common_name = common_name
        @scientific_name = scientific_name
        @id = id  
    end 


end 