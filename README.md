Snack App
=========

Create basic Sinatra app
------------------------

Do this however you know how.  Maybe you even have a snippet.

Integrate ActiveRecord into Sinatra
-----------------------------------

Install the necessary gems:

- `gem install sinatra-activerecord`
- `gem install rake`

Require `sinatra-activerecord` in your `app.rb`:

`require "sinatra/activerecord"`

Create a `config/database.yml`:

```ruby
development:
  adapter: postgresql
  database: snack_app
```

Create `Rakefile`:

```ruby
require './app'
require 'sinatra/activerecord/rake'
```

 Test it by running `rake -T`

```sh
$ rake -T
rake db:create              # Creates the database from DATABASE_URL or config/database.yml for the current RAILS_ENV
rake db:create_migration    # Create a migration (parameters: NAME, VERSION)
rake db:drop                # Drops the database from DATABASE_URL or config/database.yml for the current RAILS_ENV
rake db:fixtures:load       # Load fixtures into the current environment's database
rake db:migrate             # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)
rake db:migrate:status      # Display status of migrations
rake db:rollback            # Rolls the schema back to the previous version (specify steps w/ STEP=n)
rake db:schema:cache:clear  # Clear a db/schema_cache.dump file
rake db:schema:cache:dump   # Create a db/schema_cache.dump file
rake db:schema:dump         # Create a db/schema.rb file that is portable against any DB supported by AR
rake db:schema:load         # Load a schema.rb file into the database
rake db:seed                # Load the seed data from db/seeds.rb
rake db:setup               # Create the database, load the schema, and initialize with the seed data
rake db:structure:dump      # Dump the database structure to db/structure.sql
rake db:structure:load      # Recreate the databases from the structure.sql file
rake db:version             # Retrieves the current schema version number
```

Use ActiveRecord to create setup your database
----------------------------------------------

Create your database (which you named in `config/database.yml`):

`rake db:create`

Create a `snacks` table my creating a migration:

`rake db:create_migration NAME=create_snacks`

This should generate a migration file in `db/migration/???_create_snacks.rb`.
Edit that file so it looks like this:

```ruby
class CreateSnacks < ActiveRecord::Migration
  def change
    create_table :snacks do |t|
      t.string :name
    end
  end
end
```

Actually run the migration with:

`rake db:migrate`

Check the status of all your migrations with:

`rake db:migrate:status`

If you made a mistrake, undo the migration with:

`rake db:rollback`


Create a Model that extends ActiveRecord::Base
----------------------------------------------

In `models/snack.rb`:

```ruby
class Snack < ActiveRecord::Base
end
```

and require it in your `app.rb`:

`require './models/snack'`

Seed your data
--------------

If you put code in `db/seeds.rb`, it can be run with the command

`rake db:seed`

Usually this is for initializing your database with values. For
instance, if I add the following code:

```ruby
Snack.create({:name => "chewy bar"})
Snack.create({:name => "gummy fruits"})
Snack.create({:name => "sunchips"})
Snack.create({:name => "nature valley bar"})
```

and run the command I will have 4 new items added to my database.
