module Gender
    MALE = 0
    FEMALE = 1
    OTHER = 2
    
    DESCRIPTION = {
      MALE => "Male",
      FEMALE => "Female",
      OTHER => "Other"
    }

    def self.all
      [MALE, FEMALE, OTHER]
    end

    def self.all_pairs
      all.collect{|grp| grp = DESCRIPTION[grp]}      
    end
  end
