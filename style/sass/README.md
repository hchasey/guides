# Sass

- [Sample](sample.scss)
- [Default SCSS-Lint configuration](.scss-lint.yml)
  - This configuration aligns with our team-wide guides below. It does _not_,
    however, enforce a particular class naming structure (`SelectorFormat`),
    which is a team decision to be made on a per-project basis.

## Formatting

* Use the SCSS syntax.
* Use hyphens when naming mixins, extends, classes, functions & variables: `span-columns` not `span_columns` or `spanColumns`.
* Use one space between property and value: `width: 20px` not `width:20px`.
* Use a blank line above a selector that has styles.
* Prefer hex color codes `#fff` or `#FFF`.
* Avoid using shorthand properties for only one value: `background-color: #ff0000;`, not `background: #ff0000;`
* Use `//` for comment blocks not `/* */`.
* Use one space between selector and `{`.
* Use double quotation marks.
* Use only lowercase, except for hex or string values.
* Don't add a unit specification after `0` values, unless required by a mixin.
* Use a leading zero in decimal numbers: `0.5` not `.5`
* Use space around operands: `$variable * 1.5`, not `$variable*1.5`
* Avoid in-line operations in shorthand declarations (Ex. `padding: $variable * 1.5 variable * 2`)
* Use parentheses around individual operations in shorthand declarations: `padding: ($variable * 1.5) ($variable * 2);`
* Use double colons for pseudo-elements
* Use a `%` unit for the amount/weight when using Sass's color functions: `darken($color, 20%)`, not `darken($color, 20)`

## Order

* Use alphabetical order for declarations.
* Place `@extends` and `@includes` at the top of your declaration list.
* Place media queries directly after the declaration list.
* Place concatenated selectors second.
* Place pseudo-states and pseudo-elements third.
* Place nested elements fourth.
* Place nested classes fifth.

## Selectors

* Don't use ID's for style.
* Use meaningful names: `$visual-grid-color` not `$color` or `$vslgrd-clr`.
* Use ID and class names that are as short as possible but as long as necessary.
* Avoid using the direct descendant selector `>`.
* Avoid nesting more than 3 selectors deep.
* Use HTML tags on vague classes that need a qualifier like `header.application` not `.main`.
* Avoid using the HTML tag in the class name: `section.news` not `section.news-section`.
* Avoid using HTML tags on classes for generic markup `<div>`, `<span>`: `.widgets` not `div.widgets`.
* Avoid using HTML tags on classes with specific class names like `.featured-articles`.
* Avoid using comma delimited selectors.
* Avoid nesting within a media query.

## Organization

* Use Bourbon for a Sass library.
* Use Neat for a grid framework.
* Use Bitters/`base` directory for styling element selectors, global variables, global extends and global mixins.
* Use [Normalize](https://github.com/necolas/normalize.css) for browser rendering consistency, rather than a reset.
* Use HTML structure for ordering of selectors. Don't just put styles at the bottom of the Sass file.
* Avoid having files longer than 100 lines.

## Introduction
CSS preprocessors have completely changed how we work with CSS, for better or worse. With greater versatility and capability comes the potential for greater complexity and ambiguity, which often leads to a maintenance workflow of head-scratching -> shrugging -> overwriting. At its core, CSS is enormously simple: Reference an html element and make a small list of rules for it. We don't want to lose that simplicity by over-engineering our SASS, but we also want to leverage whatever is helpful about preprocessors that actually for real will help eliminate maintenance time and headaches.

With that in mind, here are the larger goals for how we're using SASS for Desiring God:

### Goals
- Well-organized file structure
- Painless maintenance
- Continuing consolidation of design patterns
- Highly performant styles that render quickly

## File Organization
SCSS folder structure is as follows.
_A more granular inventory of our modules and classes, including the full folder structure, is in our [BEM Tree](https://desiringgod.box.com/s/3j3i84xs6426ikyhurhwn7v9veki7zpp) (Updated 3/30/16). This document does not contain chain modifiers._
```
app/assets/stylesheets
├──application.css.scss
│
├── /config
│   ├── _grid.scss
│   ├── _typography.scss
│   └── ...
│
├── /helpers
│   ├── _animation.scss
│   ├── _ellipsis.scss
│   └── ...
│
├── /modules
│   ├── _html.scss
│   ├── _page.scss
│   ├── ...
│   │
│   ├── /grid
│   │   ├── _grid-classes.scss
│   │   ├── _grid-debug.scss
│   │   └── ...
│   │
│   ├── /cards
│   │   ├── _card.scss
│   │   ├── _card--resource.scss
│   │   └── ...
│   │
│   ├── /header
│   │   ├── _header.scss
│   │   ├── _logo.scss
│   │   └── ...
│   │
│   └── ...
│
└── /legacy
    ├── _sidebar.scss
    ├── _result-list.scss
    ├── ...
    │
    ├── /indexes
    │   ├── _meta-nav.scss
    │   ├── _articles-index.scss
    │   └── ...
    │
    └── ...
```

- `_application.scss`: Compilation manifest file. Imports all .scss files.
- `/config`: Contains sass-maps and variables that are used across the entire project.
- `/helpers`: Mixins and functions to be used as helpers for code generation or math
- `/modules`: BEVM modules, organized (if necessary) in sub-folders by _common concern_
- `/legacy`: CSS that is still in use but is either written in legacy syntax or supporting UI that will eventually be retired/replaced/refactored.

## Extensions
- Susy
- Breakpoint _to be retired_
- _Autoprefixer_ – description TBD

## CSS Class Nomenclature: BE(V)M
We are using a modified syntax of the [BEM](http://getbem.com/introduction/) methodology that separates modifiers into _variations_ and _chained modifiers_, nicely articulated by Dan Tello ([Sassier (BE)Modifers](https://www.viget.com/articles/bem-sass-modifiers)) and Jordan Lewis ([Chainable BEM Modifiers](http://webuild.envato.com/blog/chainable-bem-modifiers/)).

#### Use of `%placeholders`
- Everything is hidden as a `%placeholder` until initiated or used, even if that thing is dependent on other things. This ensures that our css compilation is as lean as possible.

#### No Sub-Elements
- As per the original BEM model, we do not use sub-elements, such as `block__element__sub-element`. In the case where an element has a sub-element, you simply use `block__sub-element`. A list of links is a good example of this:

 ```
  .list
    .list__item
      .list__item-link
 ```

 Note how `.list__item-link` is not `.list__item__link`. Its name suggests that it belongs to `.list`, not `.list-item`, even though it's contained within `.list__item`.

#### @extend usage: Variations
Variations (`block__element--variation`, `block--variation`) are the only selectors that use @extend.

#### Special cases where `%placeholder` is not appropriate
The typography module and ones similar should be written as a combination of mixins and sass-maps, since its large number of rule-sets would quickly become unwieldy if we liberally applied them. A good approach for typography would be to spec out the different variations as a sass-map and work with that sass-map through a type() mixin of sorts. Doug Avery [writes a bit about how sass-maps help give order and structure to variables](https://www.viget.com/articles/sass-with-maps).

## Syntax Style Guide
- Do not use `!important` unless absolutely without a doubt unavoidable
- Two (2) space indentation
- Keep lines at a maximum of 80 characters
- No trailing whitespace at the end of lines or files
- Line spacing
  - One selector per line
  - One rule per line
  - If there is a single rule for a selector, then you can leave it all on one line
  - One line of white space between selector blocks
- Order of properties:
  1. @extend
  2. @include
  3. Properties Defining the Position
    - Specific properties: `display`, `position`, `overflow`, `width`, `height`, `top` (etc), `transform`, `float`
  4. Other Properties in alpha order

#### Javascript Selectors
- See the [JavaScript Guide](https://github.com/desiringgod/desiring-god-new/wiki/Javascript-Guide#coding-1)

#### Portability
Do not use qualified selectors.
- Bad: `input.button {}`
- Good: `.button {}`

One of the only times to use a *semi*-qualified selector is something like the following. This could help future developers understand a bit more of what's being styled without actually qualifying the selector.

`/*ul*/.nav {}`

#### Style Order
_This needs to be updated once moving everything back to @import in application.css.scss_
- @extends
- @includes
- regular styles

#### Variables
- If you use a number more than once then think about adding it as a variable.
- All colors should be variablized

## SCSS Linting
We use the sass-lint npm package. To use, run `npm run sass-lint` in your terminal.

#### sass-lint rules
Currently we are using these rules (1 is a warning, 2 is an error):
Note: There are other configurable options with some of these. You can see the full rules in `.sass-lint.yml`
Documentation on rules: https://github.com/sasstools/sass-lint/tree/master/docs/rules

- one-declaration-per-line: 2
- no-color-keywords: 2
- no-debug: 1
- no-duplicate-properties: 2
- no-empty-rulesets: 2
- no-invalid-hex: 1
- no-mergeable-selectors: 2
- no-misspelled-properties: 1
- no-trailing-whitespace: 1
- no-trailing-zero: 1
- no-url-protocols: 1
- no-vendor-prefixes: 1
- no-warn: 1
- class-name-format: 2
- placeholder-name-format: 1
- brace-style: 2
- hex-length: 2
- leading-zero: 2
- nesting-depth: 2
- shorthand-values: 2
- url-quotes: 1
- variable-for-property: 1
- zero-unit: 1
- space-after-comma: 2
- space-after-colon: 2
- space-before-brace: 2
- space-before-bang: 1
- space-after-bang: 1
- space-between-parens: 1
- space-around-operator: 2
- trailing-semicolon: 2
- final-newline: 1

## The text() mixin and text settings
The `text()` mixin processes text properties to either be matched to predefined _sets_, or to override defaults. There are several advantages for using this mixin:
1. It softly enforces only specific font sizes, weights and parameters to keep our typography on the site consistent.
2. Auto-calculates overridable line heights to provide vertical rhythm
3. It allows us to establish predefined _sets_ for common font styles, such as resource titles or labels.

#### $text-families
- In `_settings/_text_families.scss`, basic font properties are established, such as optimal line height percentage ranges, sizes and weights. Unless a new specification comes in from design, these properties shouldn't be altered. This helps ensure consistency in our font usage.

#### Defining sets
- Define sets in a sass map in `_settings/_text.scss`.
- Reference sets in the text() mixin as a first parameter. Example: `@include text(label)`

#### Overriding defaults
- There are several text properties that have defaults:
  - $set
  - $family (`font-family`)
  - $size (`font-size`)
  - $weight (`font-weight`)
  - $style (`font-style`)
  - $line-height (`line-height`)
  - $color (`color`)

To override any of these properties, set the variable explicitly in the text() mixin. Example: `@include text($size: m)`

The value of the property can either be a key from $text-families in `_settings/_text_families.scss` or be an actual quantifiable value. The mixin determines whether a value is referencing a $text-families key or is a quantifiable value.

## Commenting
Always side on making too many comments versus not enough. Comments should get stripped when compiling.

#### Compiled comments
Comments using the `/* */` pattern will be output in our final stylesheet.
```scss
/**
 * I am a long-form comment. I describe, in detail, the CSS that follows. I am
 * such a long comment that I easily break the 80 character limit, so I am
 * broken across several lines.
 */
```

#### Hidden Comments
Comments using the single line pattern `//` are only visible in scss files and will not be compiled.

```scss
//---------------------------------------------//
// This will all go away on compile.
//---------------------------------------------//

```