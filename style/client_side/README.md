This documentation provides assistance, direction and best practices for the client-side development on at Desiring God.

The goal behind the choices for structure and technologies is to keep views, css and assets as DRY and maintainable as possible.

## Technologies

### ERB
Views are written in ERB templates. This is to use HTML as much as possible, avoiding unecessary language abstractions

### SASS
CSS is written in [SASS](http://sass-lang.com/). See our CSS Style Guide for some detailed coding practices.

### HMR with Webpack
HMR (hot module replacement) allows us to view changes to css without doing a full browser refresh. We use [Webpack's built in HMR support](https://webpack.js.org/guides/hot-module-replacement/#hmr-with-stylesheets) for a number of things, including live reloading of CSS assets.

## Markup Structure

### Components

(Details coming soon. This subject has it's own document)

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

* `.scss-lint.yml`

More information : https://github.com/brigade/scss-lint#installation

**ESLINT**

* `.eslintrc` - Defines our JavaScript style rules
* `.eslintignore` - Tells Eslint which file to ignore

More information : https://eslint.org/