object false

node (:meta) do
	{
		:total => @users.count
	}
end

node (:users) { partial('api/ember_api/v0/users/list_users', :object => @users) }