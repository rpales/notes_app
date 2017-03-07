class NoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :title, :user_id
end
