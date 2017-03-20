Fabricator(:user) do
	username { Faker::Name.name }
	email { |attrs| "#{attrs[:username].parameterize}@example.com" } 
	password 'dinhminh'
	password_confirmation 'dinhminh'
end
