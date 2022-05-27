secret = "tacos"
encrypted_secret = BCrypt::Password.create(secret)

puts encrypted_secret

decrypted_secret = BCrypt::Password.new(encrypted_secret)

puts decrypted_secret # nope

puts "Is the password 'puppies'?"
puts decrypted_secret == "puppies"

puts "Is the password 'tacos'?"
puts decrypted_secret == "tacos"