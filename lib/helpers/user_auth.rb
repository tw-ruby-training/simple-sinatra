module UserAuth
	def auth(username, password)
		@user = User.find_by(username: params['username'], password: params['password'])
		unless @user.nil?
			session['username'] = username
			true
		else
			false
		end
	end

	def invalid_params?(input)
		input.nil? || input.empty?
	end
end
