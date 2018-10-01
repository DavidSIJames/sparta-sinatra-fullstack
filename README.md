# sparta sinatra fullstack

## Description
The aim of this homework is to create a fullstack website with two resources.

The website must have full CRUD functionality with MVC,a static directory, a public folder and must be styled with css and scss.

## Technology used

* ruby
* sinatra
* Postgres
* scss

## How to Download
1. If you do not have git installed follow this [guide](https://gist.github.com/derhuerst/1b15ff4652a867391f03)
2. If you do not have Postgres installed follow this [guide](http://www.postgresqltutorial.com/install-postgresql/)
3. In your browser, navigate to this [page](https://github.com/DavidSIJames/sparta-sinatra-fullstack)
4. Open your Terminal and navigate to where you want to clone the repo.
5. Once there, enter the following command to clone the repo:

	```terminal
	git clone git@github.com:DavidSIJames/sparta-sinatra-fullstack.git
	```
6. once the repo has been cloned, cd into it using this command:

	```terminal
	cd sparta-sinatra-fullstack
	```
7. you are now in the repo

8. open Postgres by typing this command into your terminal:

  ```terminal
  psql
  ```
9. create a database using the command:

  ```terminal
  CREATE DATABASE games;
  ```
10. exit postgres using the command:
  ```terminal
  \q
  ```
11. populate the database with tables and data with this command:
  ```terminal
  psql -d games -f seed.sql
  ```
12. your database is now populated and is ready to be used with this project

## Challenges

No challenges faced during this homework

## Takeaway

Overall I am happy with the progress of this homework and am fairly confident with my ability to create a fullstack website using sinatra  
