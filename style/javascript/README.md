JavaScript
==========

[Sample](sample.js)

* Prefer ES6 classes over prototypes.
* Use strict equality checks (`===` and `!==`) except when comparing against
  (`null` or `undefined`).
* Prefer [arrow functions] `=>`, over the `function` keyword except when
  defining classes or methods.
* Use semicolons at the end of each statement.
* Prefer single quotes.
* Use `PascalCase` for classes, `lowerCamelCase` for variables and functions,
  `SCREAMING_SNAKE_CASE` for constants, `_singleLeadingUnderscore` for private
  variables and functions.
* Prefer [template strings] over string concatenation.
* Prefer promises over callbacks.
* Prefer array functions like `map` and `forEach` over `for` loops.
* Use `const` for declaring variables that will never be re-assigned, and `let`
  otherwise.
* Avoid `var` to declare variables.
* Use a [trailing comma] after each item in a multi-line array or object
  literal, including the last item.

[template strings]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/template_strings
[arrow functions]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions
[trailing comma]: /style/javascript/sample.js#L11

## Webpack Entry Files

Our build system requires what's called an entry file. An entry file is the root file which imports all the code used by that particular script.
An example of this is our `application_development.js` entry file. If you open that file, you'll see a bunch of imports and
instantiations. Entry files should only contain code that gets things going. Try to avoid putting logic into these files.

Every now and the, you'll want to write some JavaScript that is particular to a single page, so it might make sense to
only include that JavaScript on that one page. Here is how you would go about doing that.

1. Create an entry file in the `app/client/webpack_entry_files/javascript` directory.
2. Import any modules that will be used for this page.
3. In the template file for this page add `javascript_pack_tag 'javascript/my_entry_file.js'` in order to include this script on your page.

**Note:** It's not necessary to have an entry file for every page. You'll most likely never need to create an entry file and will just import your module
in `app/client/webpack_entry_files/javascript/application_development.js`.