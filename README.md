# README for the Security Shopping Exercise #

This is a 'deliberate practice' exercise for working with Rails. As before, the goal here is to have an example that lets us better understand one part of a Rails application, and not to have a perfect example. To that end this shopping example is purely for exploring security in a Rails application.

This shopping example is a simplified and modified version of a messy solution to the BDD Shopping Example at https://github.com/scharlau/BDD_Shopping. This has some specific gem requirements, so check that you meet those if something isn't quite right.

Look at the BDD example too if you're not sure about how that works, and why it's a useful approach to testing with Rails.

This 'security' example is here to show how we move from an 'insecure' to a 'more secure' site using OWASP approaches found at https://www.owasp.org/index.php/Main_Page and in particular the Rails Cheat Sheet at https://www.owasp.org/index.php/Ruby_on_Rails_Cheatsheet (now moved to GitHub at https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Ruby_on_Rails_Cheatsheet.md) and the Rails Guide on Security http://guides.rubyonrails.org/security.html

By using the capybara components we can quickly check what's working or not for our code.

#### This is mostly a thought exercise. For now the parts below relate to how you might make use of these ideas as part of a discussion about web site security. ####

To show how security can be added during development this app uses the brakeman gem to https://brakemanscanner.org highlight how your code can be scanned for vulnerabilities and thus fixed before they become an issue. Another one that you might want to also look at in adding to this is http://gauntlt.org which is built with cucumber and gherkin to write scenarios around security tools.

## Setting Up the Exercises ##

Pull the Git repository via download, or by cloning to your computer. Run

    bundle install

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

In this example the shopping cart doesn't work. That's something that I'll fix in a future update. For now it means you should not create cart objects as they will not show up on the page.

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

## This is mostly a thought exercise ##

1. Round one should be considering what you'd want to check when building such an app. See the OWASP links above. One group should consider the benefits of 'build it and then think of the OWASP guides'. One group should consider the benefits of 'OWASP in mind as you build'. What would these two look like in practice?
2. Round two should be running brakeman on the app - just type 'brakeman -o output_file' in the command line in the root of the app and it will generate a report for you as 'output_file' in the project directory.
3. Round three is considering what you would do next for this app. What could you do to create a vulnerability for brakeman to find? Try it out.
