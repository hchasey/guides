Best Practices
==============

A guide for programming well.

General
-------

* These are not to be blindly followed; strive to understand these and ask
  when in doubt.
* Don't duplicate the functionality of a built-in library.
* Don't write code that guesses at future functionality.
* [Keep the code simple].

[Keep the code simple]: http://www.readability.com/~/ko2aqda2

Object-Oriented Design
----------------------

* Avoid global variables.
* Avoid long parameter lists.
* Prefer composition over inheritance.
* Prefer small methods. Between one and five lines is best.
* Prefer small classes with a single, well-defined responsibility. When a
  class exceeds 100 lines, it may be doing too many things.
* [Tell, don't ask].

[Tell, don't ask]: http://robots.thoughtbot.com/post/27572137956/tell-dont-ask

Ruby
----

* Avoid optional parameters. Does the method do too much?
* Avoid monkey-patching.
* Generate necessary [Bundler binstubs] for the project, such as `rake` and
  `rspec`, and add them to version control.
* Prefer classes to modules when designing functionality that is shared by
  multiple models.
* Prefer `private` when indicating scope. Use `protected` only with comparison
  methods like `def ==(other)`, `def <(other)`, and `def >(other)`.

[Bundler binstubs]: https://github.com/sstephenson/rbenv/wiki/Understanding-binstubs

Rails
-----

* [Add foreign key constraints][fkey] in migrations.
* Avoid bypassing validations with methods like `save(validate: false)`,
  `update_attribute`, and `toggle`.
* Avoid naming methods after database columns in the same class.
* Don't change a migration after it has been merged into master if the desired
  change can be solved with another migration.
* Don't reference a model class directly from a view.
* Don't return false from `ActiveModel` callbacks, but instead raise an
  exception.
* Don't use instance variables in partials. Pass local variables to partials
  from view templates.
* Don't use SQL or SQL fragments (`where('inviter_id IS NOT NULL')`) outside of
  models.
* Generate necessary [Spring binstubs] for the project, such as `rake` and
  `rspec`, and add them to version control.
* If there are default values, set them in migrations.
* Keep `db/schema.rb` or `db/development_structure.sql` under version control.
* Use `_url` suffixes for named routes in mailer views and [redirects].  Use
  `_path` suffixes for named routes everywhere else.
* Validate the associated `belongs_to` object (`user`), not the database column
  (`user_id`).
* Prefer `Time.zone.parse("2014-07-04 16:05:37")` over `Time.parse("2014-07-04 16:05:37")`
* Use `ENV.fetch` for environment variables instead of `ENV[]`so that unset
  environment variables are detected on deploy.
* [Use blocks][date-block] when declaring date and time attributes in FactoryGirl factories.
* Use `touch: true` when declaring `belongs_to` relationships.

[date-block]: /best-practices/samples/ruby.rb#L10
[fkey]: http://robots.thoughtbot.com/referential-integrity-with-foreign-keys
[`.ruby-version`]: https://gist.github.com/fnichol/1912050
[redirects]: http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30
[Spring binstubs]: https://github.com/sstephenson/rbenv/wiki/Understanding-binstubs
[prevent tampering]: http://blog.bigbinary.com/2013/03/19/cookies-on-rails.html
[class constant in association]: https://github.com/thoughtbot/guides/blob/master/style/rails/sample.rb

Testing
-------

* Follow guidelines in [Better Specs][better-specs]
* Look to your team to make judgment calls. Your team is your best friend in helping you make them.
* The rules are intended to serve us, not rule us. If a rule is not benefiting us, it can be circumvented.
* Write tests for non-trivial code. This saves us money. 
* Don't write tests for trivial code. This also saves us money.
* Make good judgements on what is trivial and what is not. Not everything that looks trivial, is so. Simple is not trivial.
* Test only happy paths in acceptance tests. Acceptances tests are end-to-end tests. 
  They are very expensive! Testing happy paths gives you enough assurance that all layers of code are working.
* Avoid testing exceptions, edge cases, convoluted logic in acceptances tests. Prefer unit tests to test them.
* Avoid using instance variables in ruby unit tests.
* Don't test private methods.
* Avoid writing tests purely for the reason of specification / documentation on libraries that are familiar and reliable. 
  A couple examples are `attr_accessor` for PORO and trivial validations for ActiveRecord Objects. 

[better-specs]: http://betterspecs.org/
[dependency injection]: http://en.wikipedia.org/wiki/Dependency_injection
[subject-example]: ../style/testing/unit_test_spec.rb
[avoid-let]: ../style/testing/avoid_let_spec.rb
[`Delayed::Job` matcher]: https://gist.github.com/3186463
[stubs and spies]: http://robots.thoughtbot.com/post/159805295/spy-vs-spy
[assertions about state]: https://speakerdeck.com/skmetz/magic-tricks-of-testing-railsconf?slide=51
[Fake]: http://robots.thoughtbot.com/post/219216005/fake-it
[SUT]: http://xunitpatterns.com/SUT.html


Background Jobs
---------------

* Write idempotent background jobs. This is helpful when re-running jobs that have failed midway.

Scripts
-------

* Write idempotent scripts. This is helpful when re-running scripts that have failed midway.
* Use PM or PL dynos when running a script on production. They help speed up running time appreciably. `--size=performance-l`

Commits
-------

* [Maintain the subject / body distinction][commit-messages] in commit messages.
  The blank line separating the subject from the body is critical.
* [Write commit messages in the imperative][commit-messages]: "Fix bug" and not "Fixed bug" or "Fixes bug".
* Communicate _context_ of the change, in the body of your commit message. Use the body to [explain why](
  http://chris.beams.io/posts/git-commit/#why-not-how).


[commit-messages]:http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[writing-commit-messages]:http://chris.beams.io/posts/git-commit/#why-not-how
