class User < ActiveRecord::Base
  include TheRole::Api::User
  structure do
  	email				:string
  	names           	:string
  	role_id				:integer
  	crypted_password 	:string
  	salt				:string
    timestamps
  end
end

