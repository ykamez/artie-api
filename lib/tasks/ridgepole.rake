namespace :ridgepole do
  desc 'Apply database schema'
  task apply: :environment do
    ENV['ALLOW_DROP_TABLE'] ||= '0'
    ENV['ALLOW_REMOVE_COLUMN'] ||= '0'
    ENV['RAILS_ENV'] ||= 'development'

    check_change_risk
    puts(ridgepole('--apply', "--file #{schema_path}"))
    Rake::Task['db:schema:dump'].invoke
  end

  desc 'Export database schema'
  task export: :environment do
    ENV['RAILS_ENV'] ||= 'development'
    puts(ridgepole('--export', '--split', "--output #{schema_path}"))
    Rake::Task['db:schema:dump'].invoke
  end

  private

    def schema_path
      Rails.root.join('db', 'schemas', 'Schemafile')
    end

    def config
      database_yml = Rails.root.join('config', 'database.yml')
      ERB.new(IO.read(database_yml)).result
    end

    def ridgepole(*options)
      command = ["export RUBYOPT='-rbundler/setup -rmakara'", '&&', 'bundle exec ridgepole', '--config', "'#{config}'", '-E', ENV['RAILS_ENV']]
      command_string = [command + options].join(' ')
      `#{command_string}`
    end

    # http://qiita.com/EastResident/items/c53c1e69d677f85a4d72
    def check_change_risk
      return if ENV['RAILS_ENV'] == 'development' || ENV['RAILS_ENV'] == 'test' # check only production and staging

      task_return = ridgepole('--diff', schema_path)
      column_condition = task_return.include?('remove_column') && ENV['ALLOW_REMOVE_COLUMN'] == '0'
      table_condition = task_return.include?('drop_table') && ENV['ALLOW_DROP_TABLE'] == '0'
      if column_condition || table_condition
        puts '[Warning]this task contains some risks: "remove_column" or "drop_table"'
        # don't disable
        # exit 1
      end
    end
end
