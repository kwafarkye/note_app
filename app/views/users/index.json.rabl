object false

node (:meta) do
	{
		:hello => @users.count
	}
end

node (:users) { partial('users/list_users', :object => @users) }