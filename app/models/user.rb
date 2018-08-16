class User < ActiveRecord::Base
  has_secure_password
  has_many :records


  def slug
    self.username.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.detect do |user|
      user.slug == slug
    end
  end
end
