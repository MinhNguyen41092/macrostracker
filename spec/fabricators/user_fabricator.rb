Fabricator(:user) do
	username 'dinhminh'
	email { |attrs| "#{attrs[:username].parameterize}@example.com" } 
	password 'dinhminh'
	password_confirmation 'dinhminh'
end
