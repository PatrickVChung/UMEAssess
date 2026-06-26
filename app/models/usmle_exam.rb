class UsmleExam < ApplicationRecord
    belongs_to :user

    validates_presence_of :user_id,:message => "Missing User id!"
    validates_presence_of :exam_type,:message => "Please Provide Exam Type!"


end
