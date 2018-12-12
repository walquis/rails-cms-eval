
$ b rails new my_project
$ b rails generate controller home index
# Added camaleon_cms gem
$ b rails generate camaleon_cms:install
$ b rake camaleon_cms:generate_migrations
$ b rake db:migrate
$ b rails server

Camaleon creates some sample data and an 'admin' user (password admin123).

# Eval Summary

Camaleon seems fast and easy to install, and has lots of possibilities.  However...
1. It was not clear how to hook the editor into existing pages.  So far, FAE is the only CMS that scratches this itch.
2. It was also not clear how to use existing authentication (the docs spoke to this issue, but it looks quite involved, and wants to modify the existing user model quite a bit, rather than just relying on existing authentication.  http://camaleon.tuzitio.com/documentation/category/139779-faqs/custom-login.html).
