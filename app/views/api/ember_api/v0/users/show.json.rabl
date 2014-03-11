object @user => :user

node (:_id) { |user| user.id.to_s }
attributes :first_name, :last_name, :email, :created_at