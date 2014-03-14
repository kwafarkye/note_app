object @user => :user

node (:id) { |user| user.id.to_s }
attributes :first_name, :last_name, :email, :created_at

child :notes, object_root: false do
	node (:id) { |note| note.id.to_s }
	attributes :note_content, :created_at
end