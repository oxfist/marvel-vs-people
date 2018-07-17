# Marvel vs. People

## Requirements
- Ruby 2.5.x
- Rails 5.2.x
- PostgreSQL 10.x

## Instructions
To run locally:
1. Clone the repo
2. Install dependencies by running `bundle install`
3. Create the database and run migrations with
   `bundle exec rails db:create db:migrate`
4. In order to seed the database with superhero data, run
   `bundle exec rails superheroes_seed`
5. To seed the rest of the data run `bundle exec rails db:seed`
6. Install `cron` for running the jobs defined in `config/schedule.rb` locally
7. Run `whenever --update-crontab --set environment='development'` to write the
   jobs to the local `crontab` and check they were correctly written with
   `crontab -l`
8. If the jobs were written but are not running, restart the `cron`
   implementation service

## Tasks
The tasks defined are the following:
1. `superheroes_seed` to seed the superhero data
2. `revive_people_rest_superheroes` to revive all people and rest all
   superheroes (update `defeated` and `fought` attributes, respectively)
3. `run_round` run a round of matches that ends with the first person defeat
4. `ranking_reset` reset the ranking starting time to current time

## Important note
There is code that runs after Rails initializes to update the `rankings` only
record, and during development there were some cases where Rails would throw an
exception because the `rankings` table didn't exist.

If this happens delete the following lines in `config/application.rb`, re-run
the command and put the lines back:

```ruby
# The code below is intended to run when the server starts to update the
# starting_at value from which the ranking is determined.
config.after_initialize do
  # Force loading of Ranking model.
  if database_exists? &&
     ActiveRecord::Base.connection.tables.include?('rankings')
    require 'ranking'
    unless defined?(Ranking).nil?
      Ranking.update(Time.current.in_time_zone('America/Santiago').midnight)
    end
  end
end
```
