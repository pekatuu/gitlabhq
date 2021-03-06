class WebHook < ActiveRecord::Base
  include HTTParty

  # HTTParty timeout
  default_timeout 10

  validates :url,
            presence: true,
            format: {
              with: URI::regexp(%w(http https)),
              message: "should be a valid url" }

  def execute(data)
    WebHook.post(url, body: data.to_json, headers: { "Content-Type" => "application/json" })
  end
  
end
# == Schema Information
#
# Table name: web_hooks
#
#  id         :integer(4)      not null, primary key
#  url        :string(255)
#  project_id :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

