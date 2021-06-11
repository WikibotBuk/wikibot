class Wiki <  ActiveRecord::Base
    validates :question, presence: true, uniqueness: true
    validates :answer, presence: true
    validates :kind, presence: true

end
