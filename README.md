# README

Zuccr is an open source social media app, heavily inspired by Facebook. Built on Ruby on Rails, alongside the curriculum of [TheOdinProject](https://www.theodinproject.com/).

Below, I've listed various key-points I found interesting while developing the app. Feel free to copy any of these.

---

**First Database Build**

For this project I used PostgreSQL in the development environment as well. This makes the deployment on Heroku easier and cleaner. 

 The initial schema I went with, supports the basic Users-Posts-Likes-Comments structure with relationships between these models, using the extremely powerful ActiveRecord's built in relations. Later this will probably be expanded to support friend requests, mentions and other types of notifications.
 
  - Database schema (V0):

 ![DB Schema](https://i.imgur.com/XCYSWvj.png)
 
 *btw I created the diagram using [this cool app](https://dbdiagram.io)*

**Devise Login/Signup**

[Devise](https://github.com/heartcombo/devise) is a powerful gem that is extremely good at handling user logins and signups, with sessions and cookies in mind. It's considered pretty secure, and when developing production applications usually devs tend to 'outsource' the user handling to a gem, like Devise.



