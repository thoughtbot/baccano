# Baccano

**This service is no longer maintained and will be taken offline on July 1, 2020.**

1. User profile images
2. `_____`
3. profit?

## Architecture

The (SVG) template for the base avatar is in `views/index.erb`. It interpolates
values from the `Avatar` Ruby object found in `avatar.rb`. There are two types
of values on `Avatar` that might be used in the template:

1. Attributes of existing elements in the template (e.g. shirt color)
2. SVG partials that can be overlayed on top of the base template (e.g.
   sunglasses)

The `Avatar` object does not contain any logic, it is simply a data object that
contains all of the variables we need in the template.

We use a separate object `Rng` to generate `Avatar` objects with random values.
It can be initialized with a seed to guarantee the same results. If no seed is
given, a random seed will automatically be used.

## Adding new random attributes

To add a new random attribute (such as eye color), do the following:

1. Add the new attribute to the `Avatar` class
2. Interpolate the new attribute in the correct place in `views/index.erb`
3. Add a function that generates a random version of your attribute to `Rng`
   (e.g. `Rng#eye_color`)
4. Use that function when randomly generating an avatar in `Rng#avatar`

## Adding a new augmentation

To add a new augmentation (such as beards), do the following:

1. Create a folder for your augmentation under `views/` (e.g. `views/beard`)
2. Put one or more variations in this folder. These are SVG files but should
   have a `.erb` extension.
3. Add the new attribute to the `Avatar` class.
4. Render the partial returned by that attribute in `views/index.erb`. (e.g.
   `<%= erb @avatar.beard %>`)
5. Add a function to `Rng` that returns a random partial for your new attribute.
   (e.g. `Rng#beard`) Take advantage of the `Rng#attribute_partial` function to
   pick a random partial from a given directory. (e.g. `attribute_partial("beard")`
   will return a random partial from the `views/beard` directory)
6. Use the function created in (5) when randomly generating an avatar in
   `Rng#avatar`

## Adding a new variant to an existing augmentation

Say you want to add a new type of sunglasses. Do the following:

1. Add the SVG file of your new variant to the existing `views/glasses` folder,
   saved with a `.erb` extension.
2. Profit!!!

## Weighted defaults

For many random attributes, we want to use a default value X% of the time.
The `Rng#percentage` allows us to do this. For example:

```ruby
  def glasses
    percentage(60, "") { attribute_partial("glasses") }
  end
```

will return default to empty string (`""`) 60% of the time, and otherwise it
will pick a random partial from the `views/glasses` directory.

Using this function when generating an avatar means that 60% of avatars will
have no glasses while the remaining 40% will have a random pair of glasses
pulled from the SVGs in the `view/glasses` directory.

## Viewing your work

To view your work locally:

1. Start a server with `foreman start`
2. Visit `localhost:5000/random`
3. Keep refreshing the page to see a new random avatar
