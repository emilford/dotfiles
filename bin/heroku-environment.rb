#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__), 'heroku-deployer')

class HerokuEnvironment
  def initialize(subcommands)
    @subcommands = subcommands
  end

  def run
    case @subcommands.first
    when nil
      system "heroku run console --remote #{@environment}"
    when 'backup'
      system "heroku pgbackups:capture --expire --remote #{@environment}"
    when 'console'
      system "heroku run console --remote #{@environment}"
    when 'migrate'
      system %{
        heroku run rake db:migrate --remote #{@environment} &&
        heroku restart --remote #{@environment}
      }
    when 'tail'
      system "heroku logs --tail --remote #{@environment}"
    when 'lv'
      system "heroku addons:open papertrail --remote #{@environment}"
    when 'url'
      system "heroku apps:info -r #{@environment} | grep -i web  | tr -s ' ' | cut -d ' ' -f 3"
    when 'deploy'
      HerokuDeployer.new(@environment, @subcommands).run

      system %{
        heroku run rake db:migrate --remote #{@environment} &&
        heroku restart --remote #{@environment}
      }
    when "db-clone"
      system "heroku pg:backups capture --remote #{@environment}"
      system "curl -o latest.dump `heroku pg:backups public-url --remote #{@environment}`"
      system "pg_restore --verbose --clean --no-acl --no-owner -h localhost -d #{@subcommands[1]} latest.dump"
      system "rm latest.dump"
    else
      system "heroku #{@subcommands.join(' ')} --remote #{@environment}"
    end
  end
end
