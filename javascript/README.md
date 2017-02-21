# Coding

We use [es6](https://github.com/lukehoban/es6features) for javascript development, transcribed to es5 by [babel](https://babeljs.io/).

Overall we are going for type 3.5 (Organize by classes with modules) from these [types of javascript applications](https://www.youtube.com/watch?v=kwSVWlzEefE). Yes to es6 classes, modules, and jquery but no to big MVC frameworks.

## Installation

[node](https://nodejs.org/en/) and [npm](https://www.npmjs.com/) are required for desiring god javascript development. The best way to get node is to use [nvm](https://github.com/creationix/nvm).

Testing requires [phantomjs](http://phantomjs.org/). The best way to install this is via homebrew: `brew update` and then `brew install phantomjs`.

### Updating and Managing Node Modules

Managing node modules in the `package.json` should mirror managing ruby gems in the `Gemfile`.

In `package.json`:

1. Make modules use the * notation which means "match any version" (similar to a gem without a version number).

   e.g. `"jquery-lazyload": "*"`

1. Specify node version strictly to the latest. (similar to ruby version definition at the top of the gemfile)

   e.g. `"node": "5.4.1"`

Updating node module process can now mirror updating rails gems.

1. To update and install the latest: `npm update`.
1. Then cleanup unused modules: `npm prune`.
1. If there is some conflict or bug with a module, strictly version the node module in the npm folder.

To view versions of modules: `npm list`.

**Note:** `npm prune`: npm only retains a single version of a specific module. So we'd only have the latest version. `npm prune` cleans up unused modules. For example if you had `underscore` as a dependency but then removed it from `package.json`, `npm update` wouldn't remove `underscore` from the node_modules folder even though it was removed from the `package.json`. Running `npm prune` would go back and clean up `underscore` from the node_modules folder.

**Tips and Gotchas**

1. [How to install node js with nvm](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-with-nvm-node-version-manager-on-a-vps)
2. You might run into an error like `env: node: No such file or directory` This most likely because you don't have a system wide version of node referenced. To solve look towards the bottom of the tutorial [here](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-with-nvm-node-version-manager-on-a-vps) or create a syslink like [here](http://stackoverflow.com/a/20077620/341692)

# Javascript Organization

- /legacy - has all the old legacy javascript files
- /modules - has the new es6 modules
- /rails_admin - (same as before rails admin js)
- /singles - are javascript files that are individually precompiled. Usually for page specific javascript but can be for other things (like mobile specific)
- application.js - still the top level appjs
- application-new.js - import your es6 modules here
- sprocket-libraries.js - require js files that cant be imported here

# Style Guide

1. Primarily we follow the [airbnb style guide](https://github.com/airbnb/javascript) when coding
1. Additionally, to keep our javascript consistent, modular, loosely coupled, and clean there are some additional coding best practices we like to follow:

#### Linting

We have a es6 linter setup to test against the airbnb style guide. To run:

`npm run eslint`

## Organization
  1. **Do** organize code in es6 classes
  1. **Do** keep 1 es6 class per file
  1. **Do** break up javascript by component/feature and preferably not by page.
  1. **Do** pass selectors into a class and don’t hardcode them into the class. This again makes things loosely coupled. (Can still have default selectors)
  1. **Do** use es6 modules exports and imports
  1. **Don’t** use other popular code organization techniques like object literals, es5 style classes with prototype functions, the module pattern, or coffeescript classes. Be consistent with es6 classes.
  1. **Don't** Write javascript / jquery code outside of a class unless it’s to initialize an instance of a class.
  1. **Don’t** use self invoking anonymous functions. We don’t need them if we properly use es6 modules with browserify. (However, do still use them in es5 code, if you have to)

## Coding
1. **Do** use the prefix ‘js-’ for css classes that are used by javascript.
1. **Don't** use complicated jQuery selectors, that will easily break if the html / css changes.
1. **Don’t** use the same css classes to style and select with javascript. This cause your styles and your javascript to be tightly bound, and we want to keep things loosely coupled.
1. **Do** try and use named functions only (even for callbacks)
1. **Do** cache jquery selectors
1. **Don’t** change styles with javascript. Changes states (with different styles) by applying different classes and then use css to style on those classes.
  1. e.g don’t write code like `$(‘#item’).css({ height: 15px; });`
  1. e.g write code like `$(‘#item’).addClass(‘disabled’);`
1. Again **Do** Follow the airbnb style guide :)

### Refactoring

1. Consider completely rethinking not only the Javascript code, but also the HTML and CSS to make it more modular.
1. Consider removing html that is creating and inserted into the DOM via javascript. Instead define the HTML in the HAML and just show/hide the component.
1. Consider grouping similar code into smaller functions. E.g. if you have code that relates to hiding a popup like `$elem1.hide(); $elem2.html(''); $elem3.html('click button to open popup')` group them into a function `hidePopup()`

## Modules

We are able to use [es6 modules](https://babeljs.io/docs/usage/modules/) with the support of [Browserify](http://browserify.org/)

1. **Do** use es6 style imports
 1. Yes `import Email from ‘./email’;`
 2. No `var Email = require(‘./email’);`
1. **Don't** `//require` javascript files. Only javascript included in gems that couldn't be `import`ed should be `//required` and only in the `sprocket-lib.js` file.
1. **Do** Use npm to pull in javascript libraries
1. **Don't** Download javascript libraries into the vendor/assets folder (this is the last resort)

### Installing npm javascript library

Using masonry as an example
1. Find the proper library on npm
  1. e.g. https://www.npmjs.com/package/masonry-layout
1. Add it to the `package.json` file
  1. `"dependencies": { /*other dependencies*/..., "masonry-layout": "~> 3.3.2" }
1. Run `npm install`
1. Include it into the file that depends on masonry
  1. es6: `import Masonry from 'masonry-layout';`
  1. es5: `var Masonry = require('masonry-layout');`

#### Installation Tips / Gotchas

1. Note when importing libraries they **might not** be added to the global scope like when you included the javascript file from the vendor folder and you might have to use it differently. e.g. Masonry has typically been added on the global scope and as a jQuery plugin, however when imported via browerify, we had to assign Masonry to a variable and use `new Masonry()` constructor to initialize instead of `$().masonry()`.
1. **Removing unused node_modules**
  1. Remove it from the `package.json` file
  1. Run `npm prune`

## Testing

Javascript Unit testing is a **yes** with [jasmine](https://github.com/jasmine/jasmine) and [teaspoon](https://github.com/modeset/teaspoon).

1. **Do** actually write test..... #WIP
1. **Do** Create a single spec per module/class
1. **Do** Create unit tests on methods
1. **Do** Use bare minimum fixtures to test basic dom manipulation functionality.
1. **Do** Continue to test javascript features via End to End feature tests

**How to run tests**

1. Command line
 1. `> rake teaspoon`
1. Via the browser
 1. Visit `/teaspoon`

**Testing tips and Gotchas**

1. [jasmine-jquery](https://github.com/velesin/jasmine-jquery#jquery-matchers) `.toHandleWith` only checks functions that are bond directly to the event. Since we will often use arrow functions or `.bind` to set the 'this' property, `.toHandleWith` will fail. Instead use [jasmine spies](http://jasmine.github.io/2.3/introduction.html#section-Spies) to make sure specific event handlers are called.
1. Runnings tests from the Browser (from '/teaspoon') will have the added benefit of if you get an error you'll be able to access the es5 transcribed code, which can be helpful for debugging.

# Turbolinks

We are using [turbolinks](https://github.com/turbolinks/turbolinks-classic) with the addition of [jquery.turbolinks](https://github.com/kossnocorp/jquery.turbolinks) as a helper / convenience library.

**Some Turbolinks notes:**

1. 3rd Party tracking libraries almost always have to be modified to work with turbolinks (e.g. Google analytics). Sometimes there are no good solutions depending on how the code is initialized (e.g. hotjar).
    1. There is a list of workaround here: http://reed.github.io/turbolinks-compatibility but these solutions will often have to be slightly modified to work with the DG system.
        1. e.g. if you look at picture fill http://reed.github.io/turbolinks-compatibility/picturefill.html the full solution isn’t needed b/c we are using jquery.turbolinks. All we had to do was initialize picturefill() within our main initialization section on application-new.js $(() => {});
    1. Unfortunately this will be an ongoing game of wackamole for each 3P tracking library we add.
1. Things in the header are not updated on turbolink page:change (except for the title).
    1. So if you have a script in the header that you want run on a specific page, it won’t be run on turbolink page:change
    1. Things like facebook meta tags, though page specific, are safe from turbolinks. This is because FB crawlers directly go to the page with javascript disabled. (same with google crawlers).
1. We have a bunch of page transition where turbolinks is disabled
    1. Most are documented here: https://github.com/desiringgod/desiring-god-new/commit/c594f860201a5a719ec30ce10c019d57c60fe3d5
    1. In the code you can see which controllers have turbolinks disables here: https://github.com/desiringgod/desiring-god-new/blob/f2bef924d7e281cfa31e3f29bb42f7c88e325593/app/helpers/application_helper.rb#L90
    1. For specific links that have turbolinks disable.. search for ‘data-no-turbolink'
1. Place for improvement:
    1. We are blanket disabling turbolinks on link’s to book pages. The only links that need to have turbolink’s disable are those that link to book pages that have a custom landing page like (http://www.desiringgod.org/books/newton-on-the-christian-life). So if we only disable turbolinks to those book landing pages instead of all book pages, we’d get a bit more usage out of Turbolinks.
1. To check if turbolinks is being triggered / working
    1. Open up the chrome console. Then click through different links. The console should never clear, and just continue to grow. If the console clears, we know there was a page refresh.
1. New Turbolinks
    1. We are using turbolink’s classic (https://github.com/turbolinks/turbolinks-classic)
    1. It looks like there is a new version 5.x.x to keep our eyes on (https://github.com/turbolinks/turbolinks)

# Single Page Javascript Modules

Some modules should only be run on a specific page or section of the site. An example of this (as of the writing of this) is the masonry library which is used for the formatting of the "books by topic" section of the site. The masonry js library is only used on that page, and would be extraneous to be loaded on other parts of the site. However, the es6 module approach we are using expects each es6 module to be loaded either once at the start of the TurboLinks session or at the beginning of each page load.

The simple solution to this issue is to place a css class or data attribute in the DOM of the specific page and check for the existence of css class or data attribute in the respective module's `initialize()` function. If it exists, run the page specific initialize code. See the "books by topic" masonry code as an example: https://github.com/desiringgod/desiring-god-new/blob/c8d7527b72c4a3f39a9cbe8933ac31460c0351ec/app/assets/javascripts/modules/book-topic-layout.es6#L12

# Resources

1. **ES6 features and syntax**
 1. [Reading](https://github.com/lukehoban/es6features#readme)
 1. [Video](https://www.youtube.com/watch?v=6AytbSdWBKg)
 1. [ES6 browser/compiler compatibility table (babel is 71%)](https://kangax.github.io/compat-table/es6/)
 1. Online books
    1. https://leanpub.com/understandinges6/read/
    1. http://exploringjs.com/es6/
 1. [All the es6 resources you could want](https://github.com/ericdouglas/ES6-Learning)
1. **Testing**
 1. [Jasmine](http://jasmine.github.io/2.3/introduction.html)
 1. [Jasmine Matchers](http://blog.bandzarewicz.com/blog/2012/03/08/jasmine-cheat-sheet/)
 1. [Jasmine jquery matchers](https://github.com/velesin/jasmine-jquery#jquery-matchers)
 1. [Jasmine tutorial vids](https://www.youtube.com/playlist?list=PLOxOmO43E6Jt0SruKGxtZs-W3PJN90G_a)
