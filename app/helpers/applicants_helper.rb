module ApplicantsHelper
 
   def status_activity(arg) 
    case arg
      when 1 
        return "Applied" 
      when 2 
        return "Shortlisted" 
      when 3 
        return "Screening" 
      when 4 
        return "Pre-hire Shortlist" 
      when 5 
        return "Offered" 
      when 7 
        return "Rejected" 
    end 
  end 
end
