[File Gravity](https://file-gravity.herokuapp.com/) 
===========

![https://file-gravity.herokuapp.com/](https://www.evernote.com/shard/s31/sh/219f85f6-6637-4404-9874-9a53d7d21eaf/05bc9390195c0077517e3e6694d111cb/deep/0/File-Gravity.png)
Live online with Heroku

##Problem statement

Create a simple application that prints out a report detailing the "weights" of the "classic" files of a user, categorized by file type. "Classic" files are those exposed by the Open API and they are visible under the "Files and Folders CLASSIC" on the left menu.

The basic weight of a file is equal to it size in KB multiplied by a "specific gravity" based on the type. The report should list for each category (if any file present) the number of files, the type, the weight of all the files of the same category (including the gravity) plus two extra lines showing the total weight of all files and the total "gravity displacement", which is the the difference between the total weights including gravity and the total ideal weights (1).

File types are Songs, Videos, Documents (office, openoffice,...), Text, Binaries, Others Gravity is 1.1 for Documents, 1.4 for Videos, 1.2 for Songs, 1 for the rest any other file types, with the results roundedup to the upper 0.05. A fixed gravity of 100 is added to Text files.

##System Dependencies

- Ruby v2.1.5
- Sinatra v1.4.5
- Sinatra Flash and Sinatra Partials
- HTTParty v0.13.3

##To Run the App Locally

You will need to have Ruby installed along with Gem and Bundle (I use Ruby Version Manager and you can get started [here](http://rvm.io/)) and you have an account with [Workshare](http://www.workshare.com/) (email and password).

#####From the commandline:

1. To run the app on your local machine clone the repository: <tt>git clone https://github.com/ruthearle/file_gravity.git</tt>

2. Navigate to the newly created repository: <tt>cd file_gravity</tt>

3. Install dependencies: <tt> bundle </tt>

4. Start the app: <tt>rackup</tt>

5. Then go to your favourite browser and type: <tt>http//localhost:9292</tt>

6. Input your Workshare registered email address and password and delight!

##How to run the test suite
File Gravity is fully tested with Rspec/Capybara (versions 3.2.0 and 2.4.4, respectively).

#####From the commandline:

1. Navigate to the directory (see step 2. above) and type: <tt>rspec</tt>

##Improvements?

I would make two improvements to the app.

Firstly, the app has a Preek smell of eight. Four of those smells come from the <tt>#basic_weight</tt> method in the <tt>.FileMeta</tt> class. Given more time I would refactor the code to reduce the amount of statements the <tt>#basic_weight</tt>method has and remove the duplicate method calls, which in turn would eliminate the smell.

Secondly, I would fully test and implement checking for incorrect input of email and password and redirecting back to the login page. At the moment when incorrect credentials are used the app throws a http 500 status code because the <tt>FileMeta::Login</tt> method is unable to save the auth token that it needs in order for the app to return a status code of 303. I have patched this by creating a custom error page that has a useful message and link for the person to try and login again.
