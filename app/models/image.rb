class Image < ActiveRecord::Base
  attr_accessible :content_type, :file_data, :file_name, :file_size
end
