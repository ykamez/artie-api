# The table of contents
  - <a href="#resource-hashtag">Hashtag</a>
  - <a href="#resource-post">Post</a>
  - <a href="#resource-post_evaluation">Post Evaluation</a>
  - <a href="#resource-user">User</a>
  - <a href="#resource-v1_hashtags">hashtag</a>
    - <a href="#link-GET-v1_hashtags-/v1/hashtags">GET /v1/hashtags</a>
    - <a href="#link-GET-v1_hashtags-/v1/hashtags/{hashtag_id}/posts">GET /v1/hashtags/{hashtag_id}/posts</a>
  - <a href="#resource-v1_posts">post</a>
    - <a href="#link-GET-v1_posts-/v1/posts">GET /v1/posts</a>
    - <a href="#link-GET-v1_posts-/v1/posts/{id}">GET /v1/posts/{id}</a>
    - <a href="#link-POST-v1_posts-/v1/posts/">POST /v1/posts/</a>
    - <a href="#link-DELETE-v1_posts-/v1/posts/{id}">DELETE /v1/posts/{id}</a>
  - <a href="#resource-v1_users">user</a>
    - <a href="#link-GET-v1_users-/v1/users">GET /v1/users</a>
    - <a href="#link-GET-v1_users-/v1/users/{id}">GET /v1/users/{id}</a>
    - <a href="#link-POST-v1_users-/v1/users/">POST /v1/users/</a>
    - <a href="#link-PATCH-v1_users-/v1/users/{id}">PATCH /v1/users/{id}</a>
    - <a href="#link-DELETE-v1_users-/v1/users/{id}">DELETE /v1/users/{id}</a>
  - <a href="#resource-v1_users_posts">post</a>
    - <a href="#link-GET-v1_users_posts-/v1/users/{user_id}/posts">GET /v1/users/{user_id}/posts</a>
 
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



## <a name="resource-v1_users_posts">post</a>

Stability: `prototype`

post apis

### <a name="link-GET-v1_users_posts-/v1/users/{user_id}/posts">post index</a>

Show a list of post.

```
GET /v1/users/{user_id}/posts
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/users/$USER_ID/posts
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


