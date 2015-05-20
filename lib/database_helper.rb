require 'yaml'

class DatabaseHelper
  class << self
    def database_uri
      config_file_path = "#{__dir__}/../config/database.yml"
      conf = YAML.load_file(config_file_path)
      "mysql://#{conf['username']}:#{conf['password']}@#{conf['host']}:#{conf['port'] || 3306}/#{conf['database']}"
    end

    def connect
      Sequel.connect(database_uri)
    end

  end

end