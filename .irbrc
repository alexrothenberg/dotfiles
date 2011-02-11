#!/usr/bin/ruby
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"


if ENV.include?('RAILS_ENV')
  if !Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
  end

  def sql(query)
    ActiveRecord::Base.connection.select_all(query)
  end
  
  if ENV['RAILS_ENV'] == 'test'
    require 'test/test_helper'
  end

# for rails 3
elsif defined?(Rails) && !Rails.env.nil?
  if Rails.logger
    Rails.logger =Logger.new(STDOUT)
    ActiveRecord::Base.logger = Rails.logger
  end
  if Rails.env == 'test'
    require 'test/test_helper'
  end
else
  # nothing to do
end

# def change_log(stream)
#   ActiveRecord::Base.logger = Logger.new(stream)
#   ActiveRecord::Base.clear_active_connections!
# end
# 
# def show_log
#   change_log(STDOUT)
# end
# 
# def hide_log
#   change_log(nil)
# end


def table_schema table_name
  schema_dumper = ActiveRecord::SchemaDumper.send :new, ActiveRecord::Base.connection  
  schema_dumper.send :table, table_name, STDOUT
end

def table_columns table_name
  columns = ActiveRecord::Base.connection.columns table_name
  puts "  def self.columns"
  puts "    @columns ||= ["
  columns.map do |column|
    puts %Q[            ActiveRecord::ConnectionAdapters::OracleEnhancedColumn.new("#{column.name}", #{column.default.inspect}, "#{column.sql_type}", #{column.null.inspect}, "#{column.table_name}", #{column.forced_column_type.inspect})]
  end
  puts "  end"
end



