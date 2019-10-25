<h1>Bike Station Manager</h1>

<p>The purpose of this exercise is the creation of a system that controls the usage of bike stations.</p>

<h2>Prerequisites</h2>
This exercise was built using Ruby on Rails version 5.2.3 and in the Gemfile it is possible to find all gems that are being used. In order to install them, run the command below in the terminal:
<pre>
 <code>bundle install</code>
</pre>

For the database, run the following commands:
<pre>
 <code>rails db:create db:migrate db:seed</code>
</pre>
They will create the database, run the necessary migrations and populate the database with some examples.

After that, run the command below to start the server
<pre>
 <code>rails s</code>
</pre>

And then access http://localhost:3000/ in your browser to use the system.

<h2>Running tests</h2>
The automated tests where built using Rspec Rails version 3.8.
For now, there are only unit tests available for the models in this project and in order to run them, run the following command in the terminal
<pre>
 <code>rspec spec/models</code>
</pre>
