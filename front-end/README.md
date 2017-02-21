This documentation provides assistance, direction and best practices for the front-end development on the Desiring God site.

The goal behind the choices for structure and technologies is to keep views, css and assets as DRY and maintainable as possible. With that in mind, a single over-arching principle should be followed:
* Keep partials as generic as possible, and let assigned layouts dictate presentation/visual design. This keeps them modular enough to be presented in different ways, if needed.

## Technologies
### HAML
Views are written in [HAML](http://haml.info/) for speed of development, ease of reading, and clean ruby integration. HAML is a simple HTML preprocessor language that takes only a very short time to learn.
* [Simple tutorial to get started quickly](http://haml.info/tutorial.html)
* [Complete reference](http://haml.info/docs/yardoc/file.REFERENCE.html)

### SASS
CSS is written in [SASS](http://sass-lang.com/). See our [[Sass Style Guide|sass-style-guide]] for some detailed coding practices.

### Guard/LiveReload
[Livereload](http://livereload.com/) allows us to view changes to css without doing a full browser refresh. We use Guard for a number of things, including LiveReload.
To use LiveReload:
* Install the [LiveReload extension](http://livereload.com/extensions/) for your browser
* In terminal in your project folder, run `guard -P livereload`
* Run the project locally and click the LiveReload icon in your browser to have guard start listening for changes
* Do a dance


## Markup Structure

### Partials
Every modular collection of content or chunk of UI should be its own partial. We break things up into small pieces like this to make them more manageable and to collaboration easier and to simplify views.

Partials that are exclusive to a specific section of the site should be put in that section's view directory.
Example: `/views/blog/_best_of.html.haml`

Partials that are potentially shared among several sections should be put in `/views/shared/`.
Example: `/views/shared/_sidebar_twitter.html.haml`

Partial files are identified by starting with underscores.

### Layouts

Layout files are identified by their location: `/views/layouts`.

There are two types of layouts: page layouts (identified by not having a preceding underscore) and partial layouts, preceded by an underscore.

A page layout is automatically assigned to a controller based on its name (Example, the layout `blog.html.haml` is automatically referenced by the `blog` controller, but can also be implicitly assigned.

Page contain markup that deals with a page's basic structure regions, such as meta nav, right sidebar, and main.

Content should be assigned to a page layout's "regions" using `content_for` in the views that are utilizing said layout.
* [content_for documentation](http://guides.rubyonrails.org/layouts_and_rendering.html#using-the-content_for-method)

A unique layout file should be made for each page on the site that has a unique layout.

All layouts inherit `views/layouts/application.html.haml`, which contains the header and footer of every page. This inheritance is done using the `inside_layout` helper. Syntax:
```
= inside_layout 'application' do
  %h1#page-title Blog
```

Partial layouts (ex: `/layouts/_sidebar_module`) can be assigned directly to a partial to wrap it using `:partial => '/shared/twitter', :layout => '/layouts/sidebar_module'`.

### Views
Although layouts and partials are all technically views, views are defined within the Desiring God project as the files our controllers actually reference, and assign our partials to layout regions using `content_for`.

View files are identified as file names without leading underscores within the `/views` folder.

## YAML (static content)

We're storing static content in YAML files so that we can pass that dynamic content between partials and develop the front-end closer to its end state when it's hooked up to a database.

Reference YAML content through a page's controller so you can access it from your views and pass it around in your partials.

## Additional Config Files

These files should not be touched.

**EditorConfig**

`.editorconfig`: This file is for unifying the coding style for different editors and IDEs

Install: http://editorconfig.org/#download

**scss (SASS) linting**

`.scss-lint.yml`

Install: https://github.com/brigade/scss-lint#installation

**JS Hint**

`.jshintrc`

Install: http://jshint.com/install/
