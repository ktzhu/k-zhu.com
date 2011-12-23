class Project
	include MongoMapper::Document

	key :project_id, ObjectId
	key :name, String, :required => true, :unique => true
	key :blurb, String
	key :content, String, :required => true
	key :client, String
	key :skills, Array
	key :link, String
	key :image, String
	timestamps!
end
