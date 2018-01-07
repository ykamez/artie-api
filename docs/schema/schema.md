# The table of contents
  - <a href="#resource-hashtag">Hashtag</a>
  - <a href="#resource-post">Post</a>
  - <a href="#resource-post_evaluation">Post Evaluation</a>
  - <a href="#resource-user">User</a>
  - <a href="#resource-v1_hashtags">hashtag</a>
    - <a href="#link-GET-v1_hashtags-/v1/hashtags">GET /v1/hashtags</a>
    - <a href="#link-GET-v1_hashtags-/v1/hashtags/{hashtag_id}/posts">GET /v1/hashtags/{hashtag_id}/posts</a>
    - <a href="#link-get-v1_hashtags-/v1/hashtags/search_result">get /v1/hashtags/search_result</a>
  - <a href="#resource-v1_posts">post</a>
    - <a href="#link-GET-v1_posts-/v1/posts">GET /v1/posts</a>
    - <a href="#link-GET-v1_posts-/v1/posts/{id}">GET /v1/posts/{id}</a>
    - <a href="#link-POST-v1_posts-/v1/posts/">POST /v1/posts/</a>
    - <a href="#link-DELETE-v1_posts-/v1/posts/{id}">DELETE /v1/posts/{id}</a>
  - <a href="#resource-v1_posts_reaction">reaction</a>
    - <a href="#link-post-v1_posts_reaction-/v1/posts/{post_id}/like">post /v1/posts/{post_id}/like</a>
    - <a href="#link-post-v1_posts_reaction-/v1/posts/{post_id}/dislike">post /v1/posts/{post_id}/dislike</a>
    - <a href="#link-post-v1_posts_reaction-/v1/posts/{post_id}/share">post /v1/posts/{post_id}/share</a>
  - <a href="#resource-v1_posts_replies">reply</a>
    - <a href="#link-get-v1_posts_replies-/v1/posts/{post_id}/replies">get /v1/posts/{post_id}/replies</a>
  - <a href="#resource-v1_posts_search_result">search_result</a>
    - <a href="#link-get-v1_posts_search_result-/v1/posts/search_result">get /v1/posts/search_result</a>
  - <a href="#resource-v1_search">search</a>
    - <a href="#link-GET-v1_search-/v1/search">GET /v1/search</a>
  - <a href="#resource-v1_users">user</a>
    - <a href="#link-GET-v1_users-/v1/users">GET /v1/users</a>
    - <a href="#link-GET-v1_users-/v1/users/{id}">GET /v1/users/{id}</a>
    - <a href="#link-POST-v1_users-/v1/users/">POST /v1/users/</a>
    - <a href="#link-PATCH-v1_users-/v1/users/{id}">PATCH /v1/users/{id}</a>
    - <a href="#link-DELETE-v1_users-/v1/users/{id}">DELETE /v1/users/{id}</a>
  - <a href="#resource-v1_users_feed">feed</a>
    - <a href="#link-GET-v1_users_feed-/v1/{user_id}/feed">GET /v1/{user_id}/feed</a>
  - <a href="#resource-v1_users_follow_follwers">follow and followers</a>
    - <a href="#link-GET-v1_users_follow_follwers-/v1/{user_id}/users/following">GET /v1/{user_id}/users/following</a>
    - <a href="#link-GET-v1_users_follow_follwers-/v1/{user_id}/users/followers">GET /v1/{user_id}/users/followers</a>
  - <a href="#resource-v1_users_hashtag">user hashtag</a>
    - <a href="#link-GET-v1_users_hashtag-/v1/{user_id}/hashtags/watching">GET /v1/{user_id}/hashtags/watching</a>
  - <a href="#resource-v1_users_posts">post</a>
    - <a href="#link-GET-v1_users_posts-/v1/{user_id}/posts">GET /v1/{user_id}/posts</a>
    - <a href="#link-GET-v1_users_posts-/v1/{user_id}/posts/hashtag_breakdown">GET /v1/{user_id}/posts/hashtag_breakdown</a>
  - <a href="#resource-v1_users_search_result">search_result</a>
    - <a href="#link-get-v1_users_search_result-/v1/users/search_result">get /v1/users/search_result</a>
  - <a href="#resource-v1_users_user_evaluation">user evaluation</a>
    - <a href="#link-GET-v1_users_user_evaluation-/v1/{user_id}/user_evaluation">GET /v1/{user_id}/user_evaluation</a>
 
## <a name="resource-hashtag">Hashtag</a>

Stability: `prototype`

Post has many hashtags.


## <a name="resource-post">Post</a>

Stability: `prototype`

Post Resource


## <a name="resource-post_evaluation">Post Evaluation</a>

Stability: `prototype`

Post Evaluation Resource


## <a name="resource-user">User</a>

Stability: `prototype`

User Resource


## <a name="resource-v1_hashtags">hashtag</a>

Stability: `prototype`

hashtag apis

### <a name="link-GET-v1_hashtags-/v1/hashtags">hashtag index</a>

Show a list of hashtag.

```
GET /v1/hashtags
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/hashtags
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": 1,
    "name": "pig"
  }
]
```

### <a name="link-GET-v1_hashtags-/v1/hashtags/{hashtag_id}/posts">hashtag show</a>

Show a specific hashtag's posts

```
GET /v1/hashtags/{hashtag_id}/posts
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/hashtags/$HASHTAG_ID/posts
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": 1,
    "text": "Pig Coin is awesome.",
    "user": {
      "id": 1,
      "display_name": "kamexx",
      "image_data": "example",
      "total_like_count": 123,
      "total_dislike_count": 123
    },
    "image_data": [
      "aws:pig_coin.png"
    ],
    "hashtag": [
      {
        "id": 1,
        "name": "pig"
      }
    ],
    "share": 123,
    "post_evaluation": {
      "like": 1248,
      "dislike": 100
    },
    "post_at": "date-time"
  }
]
```

### <a name="link-get-v1_hashtags-/v1/hashtags/search_result">hashtag search_result</a>

get a hashtag's search_result

```
get /v1/hashtags/search_result
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/hashtags/search_result
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": 1,
    "name": "pig"
  }
]
```


## <a name="resource-v1_posts">post</a>

Stability: `prototype`

post apis

### <a name="link-GET-v1_posts-/v1/posts">post index</a>

Show a list of post.

```
GET /v1/posts
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/posts
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": 1,
    "text": "Pig Coin is awesome.",
    "user": {
      "id": 1,
      "display_name": "kamexx",
      "image_data": "example",
      "total_like_count": 123,
      "total_dislike_count": 123
    },
    "image_data": [
      "aws:pig_coin.png"
    ],
    "hashtag": [
      {
        "id": 1,
        "name": "pig"
      }
    ],
    "share": 123,
    "post_evaluation": {
      "like": 1248,
      "dislike": 100
    },
    "post_at": "date-time"
  }
]
```

### <a name="link-GET-v1_posts-/v1/posts/{id}">post show</a>

Show a specific post

```
GET /v1/posts/{id}
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/posts/$ID
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 1,
  "text": "Pig Coin is awesome.",
  "user": {
    "id": 1,
    "display_name": "kamexx",
    "image_data": "example",
    "total_like_count": 123,
    "total_dislike_count": 123
  },
  "image_data": [
    "aws:pig_coin.png"
  ],
  "hashtag": [
    {
      "id": 1,
      "name": "pig"
    }
  ],
  "share": 123,
  "post_evaluation": {
    "like": 1248,
    "dislike": 100
  },
  "post_at": "date-time"
}
```

### <a name="link-POST-v1_posts-/v1/posts/">post create</a>

create post

```
POST /v1/posts/
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **text** | *string* | post's text | `"Pig Coin is awesome."` |
| **user_id** | *integer* | unique identifier of user | `1234` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **image_data** | *array* |  | `["aws:pig_coin.png"]` |


#### Curl Example

```bash
$ curl -n -X POST http://coinnow.local/v1/posts/ \
  -d '{
  "text": "Pig Coin is awesome.",
  "user_id": 1234,
  "image_data": [
    "aws:pig_coin.png"
  ]
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "id": 1,
  "text": "Pig Coin is awesome.",
  "user": {
    "id": 1,
    "display_name": "kamexx",
    "image_data": "example",
    "total_like_count": 123,
    "total_dislike_count": 123
  },
  "image_data": [
    "aws:pig_coin.png"
  ],
  "hashtag": [
    {
      "id": 1,
      "name": "pig"
    }
  ],
  "share": 123,
  "post_evaluation": {
    "like": 1248,
    "dislike": 100
  },
  "post_at": "date-time"
}
```

### <a name="link-DELETE-v1_posts-/v1/posts/{id}">post delete</a>

update post

```
DELETE /v1/posts/{id}
```


#### Curl Example

```bash
$ curl -n -X DELETE http://coinnow.local/v1/posts/$ID \
  -d '{
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 202 Accepted
```



## <a name="resource-v1_posts_reaction">reaction</a>

Stability: `prototype`

reaction apis

### <a name="link-post-v1_posts_reaction-/v1/posts/{post_id}/like">reaction like</a>

like a post

```
post /v1/posts/{post_id}/like
```


#### Curl Example

```bash
$ curl -n -X post http://coinnow.local/v1/posts/$POST_ID/like \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "id": 1,
  "text": "Pig Coin is awesome.",
  "user": {
    "id": 1,
    "display_name": "kamexx",
    "image_data": "example",
    "total_like_count": 123,
    "total_dislike_count": 123
  },
  "image_data": [
    "aws:pig_coin.png"
  ],
  "hashtag": [
    {
      "id": 1,
      "name": "pig"
    }
  ],
  "share": 123,
  "post_evaluation": {
    "like": 1248,
    "dislike": 100
  },
  "post_at": "date-time"
}
```

### <a name="link-post-v1_posts_reaction-/v1/posts/{post_id}/dislike">reaction dislike</a>

dislike a post

```
post /v1/posts/{post_id}/dislike
```


#### Curl Example

```bash
$ curl -n -X post http://coinnow.local/v1/posts/$POST_ID/dislike \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "id": 1,
  "text": "Pig Coin is awesome.",
  "user": {
    "id": 1,
    "display_name": "kamexx",
    "image_data": "example",
    "total_like_count": 123,
    "total_dislike_count": 123
  },
  "image_data": [
    "aws:pig_coin.png"
  ],
  "hashtag": [
    {
      "id": 1,
      "name": "pig"
    }
  ],
  "share": 123,
  "post_evaluation": {
    "like": 1248,
    "dislike": 100
  },
  "post_at": "date-time"
}
```

### <a name="link-post-v1_posts_reaction-/v1/posts/{post_id}/share">reaction share</a>

share a post

```
post /v1/posts/{post_id}/share
```


#### Curl Example

```bash
$ curl -n -X post http://coinnow.local/v1/posts/$POST_ID/share \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "id": 1,
  "text": "Pig Coin is awesome.",
  "user": {
    "id": 1,
    "display_name": "kamexx",
    "image_data": "example",
    "total_like_count": 123,
    "total_dislike_count": 123
  },
  "image_data": [
    "aws:pig_coin.png"
  ],
  "hashtag": [
    {
      "id": 1,
      "name": "pig"
    }
  ],
  "share": 123,
  "post_evaluation": {
    "like": 1248,
    "dislike": 100
  },
  "post_at": "date-time"
}
```


## <a name="resource-v1_posts_replies">reply</a>

Stability: `prototype`

get reply apis

### <a name="link-get-v1_posts_replies-/v1/posts/{post_id}/replies">reply reply</a>

get a post's replies

```
get /v1/posts/{post_id}/replies
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/posts/$POST_ID/replies
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": 1,
    "text": "Pig Coin is awesome.",
    "user": {
      "id": 1,
      "display_name": "kamexx",
      "image_data": "example",
      "total_like_count": 123,
      "total_dislike_count": 123
    },
    "image_data": [
      "aws:pig_coin.png"
    ],
    "hashtag": [
      {
        "id": 1,
        "name": "pig"
      }
    ],
    "share": 123,
    "post_evaluation": {
      "like": 1248,
      "dislike": 100
    },
    "post_at": "date-time"
  }
]
```


## <a name="resource-v1_posts_search_result">search_result</a>

Stability: `prototype`

get search_result apis

### <a name="link-get-v1_posts_search_result-/v1/posts/search_result">search_result search_result</a>

get a post's search_result

```
get /v1/posts/search_result
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/posts/search_result
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": 1,
    "text": "Pig Coin is awesome.",
    "user": {
      "id": 1,
      "display_name": "kamexx",
      "image_data": "example",
      "total_like_count": 123,
      "total_dislike_count": 123
    },
    "image_data": [
      "aws:pig_coin.png"
    ],
    "hashtag": [
      {
        "id": 1,
        "name": "pig"
      }
    ],
    "share": 123,
    "post_evaluation": {
      "like": 1248,
      "dislike": 100
    },
    "post_at": "date-time"
  }
]
```


## <a name="resource-v1_search">search</a>

Stability: `prototype`

search apis

### <a name="link-GET-v1_search-/v1/search">search search</a>

Show a list of users and hashtags

```
GET /v1/search
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/search
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "users": [
    {
      "id": 1,
      "display_name": "kamexx",
      "image_data": "example",
      "total_like_count": 123,
      "total_dislike_count": 123
    }
  ],
  "hashtags": [
    {
      "id": 1,
      "name": "pig"
    }
  ]
}
```


## <a name="resource-v1_users">user</a>

Stability: `prototype`

user apis

### <a name="link-GET-v1_users-/v1/users">user index</a>

Show a list of user.

```
GET /v1/users
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/users
 -G \
  -d 
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": 1,
    "display_name": "kamexx",
    "image_data": "example",
    "total_like_count": 123,
    "total_dislike_count": 123
  }
]
```

### <a name="link-GET-v1_users-/v1/users/{id}">user show</a>

Show a specific user

```
GET /v1/users/{id}
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/users/$ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 1,
  "display_name": "kamexx",
  "image_data": "example",
  "total_like_count": 123,
  "total_dislike_count": 123
}
```

### <a name="link-POST-v1_users-/v1/users/">user create</a>

create user

```
POST /v1/users/
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **display_name** | *string* | a display_name of user | `"kamexx"` |
| **email** | *email* | user email address | `"username@example.com"` |
| **password** | *string* | user password | `"letmein1234"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **image_data** | *string* | user's icon | `"example"` |


#### Curl Example

```bash
$ curl -n -X POST http://coinnow.local/v1/users/ \
  -d '{
  "display_name": "kamexx",
  "image_data": "example",
  "email": "username@example.com",
  "password": "letmein1234"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "id": 1,
  "display_name": "kamexx",
  "image_data": "example",
  "total_like_count": 123,
  "total_dislike_count": 123
}
```

### <a name="link-PATCH-v1_users-/v1/users/{id}">user update</a>

update user

```
PATCH /v1/users/{id}
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **display_name** | *string* | a display_name of user | `"kamexx"` |
| **email** | *email* | user email address | `"username@example.com"` |
| **password** | *string* | user password | `"letmein1234"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **image_data** | *string* | user's icon | `"example"` |


#### Curl Example

```bash
$ curl -n -X PATCH http://coinnow.local/v1/users/$ID \
  -d '{
  "display_name": "kamexx",
  "image_data": "example",
  "email": "username@example.com",
  "password": "letmein1234"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 1,
  "display_name": "kamexx",
  "image_data": "example",
  "total_like_count": 123,
  "total_dislike_count": 123
}
```

### <a name="link-DELETE-v1_users-/v1/users/{id}">user delete</a>

update user

```
DELETE /v1/users/{id}
```


#### Curl Example

```bash
$ curl -n -X DELETE http://coinnow.local/v1/users/$ID \
  -d '{
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 202 Accepted
```



## <a name="resource-v1_users_feed">feed</a>

Stability: `prototype`

user feed apis

### <a name="link-GET-v1_users_feed-/v1/{user_id}/feed">feed index</a>

Show a user's feed

```
GET /v1/{user_id}/feed
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/$USER_ID/feed
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": 1,
    "text": "Pig Coin is awesome.",
    "user": {
      "id": 1,
      "display_name": "kamexx",
      "image_data": "example",
      "total_like_count": 123,
      "total_dislike_count": 123
    },
    "image_data": [
      "aws:pig_coin.png"
    ],
    "hashtag": [
      {
        "id": 1,
        "name": "pig"
      }
    ],
    "share": 123,
    "post_evaluation": {
      "like": 1248,
      "dislike": 100
    },
    "post_at": "date-time"
  }
]
```


## <a name="resource-v1_users_follow_follwers">follow and followers</a>

Stability: `prototype`

follow followers apis

### <a name="link-GET-v1_users_follow_follwers-/v1/{user_id}/users/following">follow and followers a user's following users</a>

Show a list of a following users

```
GET /v1/{user_id}/users/following
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/$USER_ID/users/following
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": 1,
    "display_name": "kamexx",
    "image_data": "example",
    "total_like_count": 123,
    "total_dislike_count": 123
  }
]
```

### <a name="link-GET-v1_users_follow_follwers-/v1/{user_id}/users/followers">follow and followers a user's following users</a>

Show a list of a followers users

```
GET /v1/{user_id}/users/followers
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/$USER_ID/users/followers
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": 1,
    "display_name": "kamexx",
    "image_data": "example",
    "total_like_count": 123,
    "total_dislike_count": 123
  }
]
```


## <a name="resource-v1_users_hashtag">user hashtag</a>

Stability: `prototype`

user hashtag apis

### <a name="link-GET-v1_users_hashtag-/v1/{user_id}/hashtags/watching">user hashtag user's watching hashtags</a>

Show a list of a user's watching hashtags.

```
GET /v1/{user_id}/hashtags/watching
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/$USER_ID/hashtags/watching
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": 1,
    "name": "pig"
  }
]
```


## <a name="resource-v1_users_posts">post</a>

Stability: `prototype`

post apis

### <a name="link-GET-v1_users_posts-/v1/{user_id}/posts">post user's posts</a>

Show a list of a user's posts

```
GET /v1/{user_id}/posts
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/$USER_ID/posts
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": 1,
    "text": "Pig Coin is awesome.",
    "user": {
      "id": 1,
      "display_name": "kamexx",
      "image_data": "example",
      "total_like_count": 123,
      "total_dislike_count": 123
    },
    "image_data": [
      "aws:pig_coin.png"
    ],
    "hashtag": [
      {
        "id": 1,
        "name": "pig"
      }
    ],
    "share": 123,
    "post_evaluation": {
      "like": 1248,
      "dislike": 100
    },
    "post_at": "date-time"
  }
]
```

### <a name="link-GET-v1_users_posts-/v1/{user_id}/posts/hashtag_breakdown">post breakdown of user's posts</a>

Show a breakdown of user's posts

```
GET /v1/{user_id}/posts/hashtag_breakdown
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/$USER_ID/posts/hashtag_breakdown
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "hashtag": {
      "id": 1,
      "name": "pig"
    },
    "posts_count": 123
  }
]
```


## <a name="resource-v1_users_search_result">search_result</a>

Stability: `prototype`

get search_result apis

### <a name="link-get-v1_users_search_result-/v1/users/search_result">search_result search_result</a>

get a user's search_result

```
get /v1/users/search_result
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/users/search_result
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": 1,
    "display_name": "kamexx",
    "image_data": "example",
    "total_like_count": 123,
    "total_dislike_count": 123
  }
]
```


## <a name="resource-v1_users_user_evaluation">user evaluation</a>

Stability: `prototype`

user evaluation apis

### <a name="link-GET-v1_users_user_evaluation-/v1/{user_id}/user_evaluation">user evaluation user evaluation</a>

user evaluation

```
GET /v1/{user_id}/user_evaluation
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/$USER_ID/user_evaluation
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "total_count_likes": 1248,
  "total_count_dislikes": 100,
  "total_count_shares": 1234
}
```

