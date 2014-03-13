collection @notes, :root => :notes, :object_root => false

node (:id) { |note| note.id.to_s }
attributes :note_content, :created_at