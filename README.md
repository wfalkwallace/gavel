Gavel
=====
[![Build Status](https://travis-ci.org/wfalkwallace/gavel.png?branch=master)](https://travis-ci.org/wfalkwallace/gavel)

---

This app is for the final project of the Columbia CS3101 Ruby on Rails class.

---

**People argue often.** This app aims to settle disputes fairly and effeciently by providing crowdsourced arbitration. Drawing on a classic _Q&A_-like interface and structure (think <http://stackoverflow.com>), **Gavel** will allow users to post arguments (allowing both vested parties to post their own recollection of events) and leave arbitration award and judgment to commenters. Judgments may be voted up or down, and at a specified threshold, an accepted verdict will be selected. The posters are asked to abide by the course of action set forth in the accepted verdict. Users with more accepted verdicts will be given tiered credentials and extended priveledges. ***One day***, premium accounts will offer verdicts from accredited professionals.

---

```
User
 \_first_name
 |_last_name
 |_email
 |_password
 |_created_at
 |_last_seen
 |_comments (has_many)                      # a user can make any number of comments
 |_responses (has_many)                     # a user can make any number of responses
 |_complaints:post (has_many)               # a user can be the complainant on any number of posts
 |_defenses:post (has_many)                 # a user can be the defendant on any number of posts
 |_votes:response (has_and_belongs_to_many) # a user can vote on any number of responses, and a response can have any number of users vote on it
Post
 \_complaint
 |_defense
 |_created_at
 |_updated_at
 |_responses (has_many)                     # a post can have any number of responses
 |_comments (has_many; polymorphic)         # a post can have any number of comments
 |_complainant:user (belongs_to)            # a post has one complainant
 |_defendant:user (belongs_to)              # a post has one defendant
Response
 \_vote_count                               # the number of upvotes a response has
 |_body                                     # the opinion
 |_verdict                                  # the proposed solution
 |_created_at
 |_updated_at
 |_author:user (belongs_to)                 # a response is written by a single user
 |_voters:user (has_and_belongs_to_many)    # a response can have any number of users vote on it, and a user can vote on any number of responses
 |_post (belongs_to)                        # a response is associated with a post
 |_comments (has_many; polymorphic)         # a response can have any number of comments
Comment
 \_body
 |_created_at
 |_updated_at
 |_author:user (belongs_to)                 # a comment is written by a user
 |_commentable (belongs_to, polymorphic)    # a comment can be associated with a post or a response; it is polymorphic
```

---

####Final Project Requirements:
1. See <https://github.com/shoupon/cs3101demo/pull/1>
2.
	- <https://github.com/wfalkwallace/gavel/blob/master/app/models/user.rb#L16>
	- `/admin`
3. `/users/id`
4. Features **3**, **6**, and **8** implemented
	- <https://github.com/wfalkwallace/gavel/blob/master/app/views/layouts/_navbar.html.erb>
	- `/users/1/edit`
	- <https://github.com/wfalkwallace/gavel/blob/master/vendor/assets/stylesheets>

---
[![Code Climate](https://codeclimate.com/github/wfalkwallace/gavel.png)](https://codeclimate.com/github/wfalkwallace/gavel)