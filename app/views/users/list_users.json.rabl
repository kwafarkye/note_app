collection @users, :root => :users, :object_root => false

node (:id) { |user| user.id.to_s }
attributes :first_name, :last_name, :email, :created_at