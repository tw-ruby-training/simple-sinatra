require 'sequel'
require 'digest/md5'

DatabaseHelper.database

class User < Sequel::Model
  extend Sequel::Model::ClassMethods

  def before_create
    self.password = Digest::MD5.new.hexdigest(self.password)
  end
end