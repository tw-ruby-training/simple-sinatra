require 'yaml'

class DatabaseHelper
  def self.database_uri
    config_file_path = "#{__dir__}/../config/database.yml"
    conf = YAML.load_file(config_file_path)
    "mysql2://#{conf['username']}:#{conf['password']}@#{conf['host']}:#{conf['port'] || 3306}/#{conf['database']}"
  end
end