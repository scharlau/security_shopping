# README for the Security Shopping Exercise #

This is a 'deliberate practice' exercise for working with Rails. As before, the goal here is to have an example that lets us better understand one part of a Rails application, and not to have a perfect example. To that end this shopping example is purely for exploring behaviour driven devlopment (BDD).

This shopping example is a simplified and modified version of a messy solution to Shopping Example at https://github.com/scharlau/Shopping_Exercise which is built upon from the 'Depot' example found in "Agile Web Development with Rails" from Pragmatic Programmers (https://pragprog.com/book/rails5/agile-web-development-with-rails-5) We're using this example, because it lets us quickly get to the BDD parts that we want to explore. This example also uses the Faker Gem from https://github.com/stympy/faker to generate sample data for the application.

The BDD example with RSpec and Capybara is based on examples found at https://robots.thoughtbot.com/rspec-integration-tests-with-capybara and some help from Stackoverflow to modify the rails_helper.rb file to find the session_helpers.rb file.

Find more on Capybara and RSPec configuration at https://www.devmynd.com/blog/setting-up-rspec-and-capybara-in-rails-5-for-testing/

## Setting Up the Exercises ##

Pull the Git repository via download, or by cloning to your computer. Run

    bundle install

To get all of the gems sorted. You might have issues with the FFI gem. On a Mac I resolved these with Homebrew, which was used to install Rails. Use

    brew install libffi
    brew install automake

Now you should be able to run

    gem install ffi

Then bundle install should complete.

Now run the migrations with either rails or rake command depending upon your platform.

    rails db:migrate

This will set up your database, and now you can run the seed_tables script to populate your database with the command:

    bin/rake products:seed_tables

This will generate data using the Faker gem that we can use in the exercises.
After you start the rails server you can now see the following items in the application:
* localhost:3000/customers
* localhost:3000/products
* localhost:3000/line_items
* localhost:3000/orders

When you start at localhost:3000 you're taken to orders/index which has a dashboard showing total orders by customers. (This still needs some rework, but that's for later. For now we just want a BDD example to use.)

## Tests are independent ##
Tests are run independent of each other, so there is no continuity when testing. If you want to build up content to test larger examples, then you need to create it within each scenario.

## Do the Work ##

Work through the three rounds with a partner, or on your own, depending upon your circumstances. Each round should be twelve minutes, followed by a discussion of where you are and what has been working, as well as, what you're working on next.

While you're doing this example you might find it useful to look at these websites for more details of how to manipulate page elements:
Cucumber Wiki https://github.com/cucumber/cucumber/wiki/
Capybara examples https://github.com/jnicklas/capybara
Capybara 'cheat sheet' http://rubydoc.info/github/jnicklas/capybara/master

There is a simple example of how to create a customer under spec/features/create_customer_spec.rb. By convention all RSpec files end with \_spec.rb to signify that they are test files. You can run this from the console with the command

    rspec

Which will launch the test system using the test database and should come back green because it works at creating a customer.


1. Round one should be adding tests for the other models too. Each of them should go into files similar to the create_customer_spec.rb file and have methods added to the session_helpers.rb file.
2. Round two should be creating a test for the 'dashboard' page to check something there.
3. Round three is adding more tests to test the integration of the models, or something else.
