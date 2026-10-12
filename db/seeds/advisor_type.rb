# db/seeds/categories.rb

advisor_types = ["Academic", "Academic/Student Affairs", "Assist Dean", "Career", "Career/Student Affairs", "DEIB", "Wellness"]

advisor_types.each do |name|
  advisorTypes = AdvisorType.find_or_create_by!(name: name)
end
