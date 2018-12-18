gem 'alchemy-devise', github: 'AlchemyCMS/alchemy-devise', branch: 'master'

$ b bin/rake alchemy_devise:install:migrations
$ b bin/rake alchemy:install
$ b rails server

At which path do you want to mount Alchemy CMS at? (DEFAULT: At root path '/') /alchemy
      insert  config/routes.rb
Running via Spring preloader in process 47962
      create  config/alchemy/config.yml
      create  config/alchemy/elements.yml
      create  config/alchemy/page_layouts.yml
      create  vendor/assets/javascripts/alchemy/admin/all.js
      create  vendor/assets/stylesheets/alchemy/admin/all.css
    conflict  app/views/layouts/application.html.erb
Overwrite /Users/walquis/dths/cms-eval/my_project/app/views/layouts/application.html.erb? (enter "h" for help) [Ynaqdhm] 
       force  app/views/layouts/application.html.erb
      create  app/assets/stylesheets/alchemy/elements/article.scss
      insert  app/assets/stylesheets/application.css
      create  app/views/alchemy/elements/_article_editor.html.erb
      create  app/views/alchemy/elements/_article_view.html.erb
      create  app/views/alchemy/page_layouts/_standard.html.erb
      create  config/locales/alchemy.de.yml
      create  config/locales/alchemy.en.yml
      create  config/locales/alchemy.es.yml
      create  config/initializers/dragonfly.rb


https://guides.alchemy-cms.com/about.html

AlchemyCMS comes with six core modules:

Pages
Languages
Sites
Users
Tags
Library (Pictures & Attachments)

With Alchemy you can split pages into content parts, aka elements. These elements can be defined from several base content types: essences (implemented as models). The basic essences are:

EssenceText - A single line of text
EssenceRichtext - A TinyMCE powered formatted text block
EssencePicture - A reference to an image
EssenceHtml - HTML embed code
EssenceSelect - A selection of values
EssenceBoolean - A checkbox
Elements get defined in a YAML file config/alchemy/elements.yml


Page types:

You can define several types of pages, called page layouts. You can assign elements to page layouts and control how elements and the page of a certain layout behave.

Page layouts get defined in a YAML file config/alchemy/page_layouts.yml


Alchemy uses Rails partials. It has no own templating language and no special files.

When Alchemy renders a typical Page, these files get usually rendered:

app/views/layouts/application.html.erb
app/views/alchemy/page_layouts/_<page_layout>.html.erb
app/views/alchemy/elements/_<element>_view.html.erb
app/views/alchemy/elements/_<essence>_view.html.erb


Essences

Essences are defined as contents on an element definition.
(I.e., Content is a polymorphic association with Essence*, as evidenced by the essence fields suffixed with "_type" and "_id".

 So, an element can combine multiple essences of multiple types.


CREATE TABLE IF NOT EXISTS "alchemy_elements" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
 "name" varchar
 "position" integer
 "page_id" integer NOT NULL
 "public" boolean DEFAULT 't'
 "folded" boolean DEFAULT 'f'
 "unique" boolean DEFAULT 'f'
 "created_at" datetime(6) NOT NULL
 "updated_at" datetime(6) NOT NULL
 "creator_id" integer
 "updater_id" integer
 "cell_id" integer
 "cached_tag_list" text
 "parent_element_id" integer);


CREATE TABLE IF NOT EXISTS "alchemy_contents" (
 "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
 "name" varchar
 "essence_type" varchar NOT NULL
 "essence_id" integer NOT NULL
 "element_id" integer NOT NULL
 "position" integer
 "created_at" datetime(6) NOT NULL
 "updated_at" datetime(6) NOT NULL
 "creator_id" integer
 "updater_id" integer);

CREATE TABLE IF NOT EXISTS "alchemy_pages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
 "name" varchar
 "urlname" varchar
 "title" varchar
 "language_code" varchar
 "language_root" boolean
 "page_layout" varchar
 "meta_keywords" text
 "meta_description" text
 "lft" integer
 "rgt" integer
 "parent_id" integer
 "depth" integer
 "visible" boolean DEFAULT 'f'
 "locked_by" integer
 "restricted" boolean DEFAULT 'f'
 "robot_index" boolean DEFAULT 't'
 "robot_follow" boolean DEFAULT 't'
 "sitemap" boolean DEFAULT 't'
 "layoutpage" boolean DEFAULT 'f'
 "created_at" datetime(6) NOT NULL
 "updated_at" datetime(6) NOT NULL
 "creator_id" integer
 "updater_id" integer
 "language_id" integer
 "cached_tag_list" text
 "published_at" datetime
 "public_on" datetime
 "public_until" datetime
 "locked_at" datetime);

