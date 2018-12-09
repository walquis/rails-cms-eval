```
$ bundle exec refinerycms rickrockstar
(Creates a bunch of files, runs "bundle install" a couple of times, which is useless because it puts them in ~/vendor/bundle, creates the sqlite3 db, runs migrations).
$ cd rickrockstar
$ rm -rf ~/vendor/bundle
$ bundle install --path=vendor/bundle
$ bundle exec rails server
```

(Error on hitting http://localhost:3000/refinery/login: 
Could not find table 'refinery_authentication_devise_roles'

Some other comments on https://gitter.im/refinery/refinerycms seem to indicate problems with Devise and authentication.

Posted on gitter, no response.  But visited https://github.com/refinery/refinerycms-authentication-devise, and the README had the clues to the answer:

"If you're moving from a pre-3.0 release of Refinery, you lost authentication when it moved out of RefineryCMS core. After installing this gem, generate and run migrations to ... re-enable authentication."

```
$ bundle exec rails g refinery:authentication:devise  # Generate migrations
$ bundle exec rake db:migrate                         # Run migrations
```

The gem was already installed, but the refinerycms scaffolding was not generating nor running the migrations for Devis that it needed.

SUCCESS!
