class PlantPlaceholder

    attr_accessor :common_name, :scientific_name, :id
    @@all = []


    def initialize(common_name, scientific_name, id)
        @common_name = common_name
        @scientific_name = scientific_name
        @id = id 
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def common_name
        @common_name 
    end  

    def common_name=(common_name)
        @common_name = common_name
    end 


end 