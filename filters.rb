# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  candidates.each do |candidate|
    return candidate if candidate[:id] == id
  end
  nil
end
  
def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end
  
def github_points_sufficient?(candidate)
  candidate[:github_points] >= 100
end

def knows_ruby_or_python?(candidate)
  candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
end

def applied_recently?(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date
end

def of_legal_age?(candidate)
  candidate[:age] >= 18
end

def qualified_candidates(candidates)
  candidates.select do |candidate|
    experienced?(candidate) && 
    github_points_sufficient?(candidate) &&
    knows_ruby_or_python?(candidate) &&
    applied_recently?(candidate) &&
    of_legal_age?(candidate)
  end
end

def ordered_by_qualifications(candidates)
  candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end
