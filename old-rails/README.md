# Getting started

To set up this on your local machine, open terminal and run these commands in the root folder:

```
gem install bundler
bundle
rake db:setup
```

This will install all dependencies and set up the database.

After these, run `rails server` to run the server. Rails will now be running on `http://localhost:3000/`.


## After changes
If someone else makes changes to the database after your initial setup, you will have to run `rake db:migrate` before running the server again. This will apply all pending migrations. Run `rake db:migrate:status` to see where you're at. ("up" means it has run).
