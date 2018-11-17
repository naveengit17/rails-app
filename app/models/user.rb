class User
    include Mongoid::Document
    validates :title , presence: true , length: {minimum: 5}
    field :title, type: String
    field :description,type: String
end