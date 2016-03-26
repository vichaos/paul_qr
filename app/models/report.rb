class Report < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  mount_uploader :attachment, PdfUploader
  structure do
  	name					:string
  	attachment				:string
    timestamps
  end


    #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:attachment),
      "size" => attachment.size,
      "url" => attachment.url,
      "delete_url" => picture_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end

