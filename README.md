    $ git clone git@gitlab.com:walquis/cms-eval
    $ cd cms-eval
    $ git checkout fae
    $ bundle install --path=vendor/bundle
    $ b rails new fae-eval
    $ cd fae-eval
    $ b rails g fae:install
    $ b rails server
    [Visit localhost:3000/admin, set up first user as above].
    $ b rails g fae:scaffold ArticleCategory name:string position:integer\n
    $ b rails g fae:page Home hero_image:image headline:string body:text
    $ b rails g fae:page AboutUs hero_image:image headline:string body:text
    $ b rails db:migrate

[Edit the navigation_concern, since the generator doesn't do that, to uncomment the nav items for 'home' and 'about us']

Got pages to work, after I overrode the hardcoded 'admin' routes in the FAE gem.

### FAE PROS:
- Able to integrate somewhere besides 'admin'.
- HTML is easy to enter.
- Handles images.

### FAE CONS
- Can only add new pages by generating new models.
- Doesn't resize images on upload.
- Not much chatter on Google, compared to, say, refinery.

### Links
https://www.faecms.com/documentation
https://www.faecms.com/documentation/quickstart-guide
https://www.faecms.com/documentation/topics-pages
https://www.faecms.com/documentation/tutorials-image_and_files
Example: https://github.com/dbbrandt/fae-app (from June 2017)
