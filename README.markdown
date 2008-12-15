dm-slug
=======

Manages your slug so you don't have to.

Internally, makes use of `DataMapper::Types::Slug`, although I'm not terribly
excited about its implementation at the moment. (After you save a model, you
have to reload it to be able to see a proper value for the slug field.)

To use, add the following to your model:

    has_slug # uses defaults of :on => name, :called => :slug

or

    has_slug :on => title, :called => permalink

You can add a `:length` option as well, though if you place your `has_slug`
anywhere below the property given in `:on`, it will pick up the length of that
field and use that instead. It will also add a `unique_index` option if the
original field has `unique_index` set to true, or if it's a key.

As shown above, if your field to create a slug on is called `:name` or if you
don't mind your slug field being called `slug`, then you can leave that
corresponding option out, as those are the defaults. If you'd like something
different, as in the second example, you can specify them and they'll get used
instead of the defaults.

Let me know if there's anything additional you'd like to see here.
