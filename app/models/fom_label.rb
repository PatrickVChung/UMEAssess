class FomLabel < ApplicationRecord
    belongs_to :fom_exam, optional: true
end
