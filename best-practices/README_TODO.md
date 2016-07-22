Best Practices TODO
===================

Mostly guides that are followed in thoughtbot that we _might_ consider applying. 

General
-------

* Don't swallow exceptions or "fail silently."
* Exceptions should be exceptional.

Object-Oriented Design
----------------------

* Limit collaborators of an object (entities an object depends on).
* Limit an object's dependencies (entities that depend on an object).

Rails
-----

* Avoid instantiating more than one object in controllers.
* Use only one instance variable in each view.
* Use SQL, not `ActiveRecord` models, in migrations.
* Use the [`.ruby-version`] file convention to specify the Ruby version and
  patch level for a project.
* Use `db/seeds.rb` for data that is required in all environments.
* Use `dev:prime` rake task for development environment seed data.
* Prefer `cookies.signed` over `cookies` to [prevent tampering].
* Prefer `Time.current` over `Time.now`
* Prefer `Date.current` over `Date.today`

[date-block]: /best-practices/samples/ruby.rb#L10
[fkey]: http://robots.thoughtbot.com/referential-integrity-with-foreign-keys
[`.ruby-version`]: https://gist.github.com/fnichol/1912050
[redirects]: http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30
[Spring binstubs]: https://github.com/sstephenson/rbenv/wiki/Understanding-binstubs
[prevent tampering]: http://blog.bigbinary.com/2013/03/19/cookies-on-rails.html
[class constant in association]: https://github.com/thoughtbot/guides/blob/master/style/rails/sample.rb

Testing
-------

* Avoid `any_instance` in rspec-mocks and mocha. Prefer [dependency injection].
* Avoid `its`, `specify`, and `before` in RSpec.
* Avoid `let` (or `let!`) in RSpec. Prefer extracting helper methods,
  but do not re-implement the functionality of `let`. [Example][avoid-let].
* Avoid using `subject` explicitly *inside of an* RSpec `it` block.
  [Example][subject-example].
* Test background jobs with a [`Delayed::Job` matcher].
* Use [stubs and spies] \(not mocks\) in isolated tests.
* Use a single level of abstraction within scenarios.
* Use an `it` example or test method for each execution path through the method.
* Use [assertions about state] for incoming messages.
* Use stubs and spies to assert you sent outgoing messages.
* Use a [Fake] to stub requests to external services.
* Use acceptance tests to execute the entire app.
* Use non-[SUT] methods in expectations when possible.

[dependency injection]: http://en.wikipedia.org/wiki/Dependency_injection
[subject-example]: ../style/testing/unit_test_spec.rb
[avoid-let]: ../style/testing/avoid_let_spec.rb
[`Delayed::Job` matcher]: https://gist.github.com/3186463
[stubs and spies]: http://robots.thoughtbot.com/post/159805295/spy-vs-spy
[assertions about state]: https://speakerdeck.com/skmetz/magic-tricks-of-testing-railsconf?slide=51
[Fake]: http://robots.thoughtbot.com/post/219216005/fake-it
[SUT]: http://xunitpatterns.com/SUT.html

Postgres
--------

* Avoid multicolumn indexes in Postgres. It [combines multiple indexes]
  efficiently. Optimize later with a [compound index] if needed.
* Consider a [partial index] for queries on booleans.
* Constrain most columns as [`NOT NULL`].
* [Index foreign keys].
* Use an `ORDER BY` clause on queries where the results will be displayed to a
  user, as queries without one may return results in a changing, arbitrary
  order.

[`NOT NULL`]: http://www.postgresql.org/docs/9.1/static/ddl-constraints.html#AEN2444
[combines multiple indexes]: http://www.postgresql.org/docs/9.1/static/indexes-bitmap-scans.html
[compound index]: http://www.postgresql.org/docs/9.2/static/indexes-bitmap-scans.html
[partial index]: http://www.postgresql.org/docs/9.1/static/indexes-partial.html
[Index foreign keys]: https://tomafro.net/2009/08/using-indexes-in-rails-index-your-associations

Background Jobs
---------------
  * Store IDs, not `ActiveRecord` objects for cleaner serialization, then re-find
  the `ActiveRecord` object in the `perform` method.

Email
-----

* Use [SendGrid] or [Amazon SES] to deliver email in staging and production
  environments.
* Use a tool like [ActionMailer Preview] to look at each created or updated mailer view
  before merging. Use [MailView] gem unless using Rails version 4.1.0 or later.

[Amazon SES]: http://robots.thoughtbot.com/post/3105121049/delivering-email-with-amazon-ses-in-a-rails-3-app
[SendGrid]: https://devcenter.heroku.com/articles/sendgrid
[MailView]: https://github.com/37signals/mail_view
[ActionMailer Preview]: http://api.rubyonrails.org/v4.1.0/classes/ActionMailer/Base.html#class-ActionMailer::Base-label-Previewing+emails

Web
---

* Avoid a Flash of Unstyled Text, even when no cache is available.
* Avoid rendering delays caused by synchronous loading.
* Use https instead of http when linking to assets.

HTML
----

* Don't use a reset button for forms.
* Prefer cancel links to cancel buttons.
* Use `<button>` tags over `<a>` tags for actions.

CSS
---

* Use Sass.
* Use [Autoprefixer][autoprefixer] to generate vendor prefixes based on the
  project-specific browser support that is needed.

[autoprefixer]: https://github.com/postcss/autoprefixer

Sass
----

* Prefer `overflow: auto` to `overflow: scroll`, because `scroll` will always
  display scrollbars outside of OS X, even when content fits in the container.
* Use `image-url` and `font-url`, not `url`, so the asset pipeline will re-write
  the correct paths to assets.
* Prefer mixins to `@extend`.

Browsers
--------

* Avoid supporting versions of Internet Explorer before IE10.

Ruby JSON APIs
--------------

* Review the recommended practices outlined in Heroku's [HTTP API Design Guide]
  before designing a new API.
* Use a fast JSON parser, e.g. [`oj`][oj]
* Write integration tests for your API endpoints. When the primary consumer of
  the API is a JavaScript client maintained within the same code base as the
  provider of the API, write [feature specs]. Otherwise write [request specs].

[HTTP API Design Guide]: https://github.com/interagent/http-api-design
[oj]: https://github.com/ohler55/oj
[feature specs]: https://www.relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec
[request specs]: https://www.relishapp.com/rspec/rspec-rails/docs/request-specs/request-specs
