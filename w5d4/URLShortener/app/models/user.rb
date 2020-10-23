# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#
class User < ApplicationRecord
validates :email, presence:true 

end 
