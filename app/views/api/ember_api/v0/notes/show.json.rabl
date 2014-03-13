object @note => :note

node (:id) { |note| note.id.to_s }
attributes :note_content, :created_at