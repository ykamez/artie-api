
## <a name="resource-message">Message</a>

Stability: `prototype`

Message Resource


## <a name="resource-post">Post</a>

Stability: `prototype`

Post Resource


## <a name="resource-room">Room</a>

Stability: `prototype`

Room Resource


## <a name="resource-tag">Tag</a>

Stability: `prototype`

Tag resource


## <a name="resource-user">User</a>

Stability: `prototype`

User Resource


## <a name="resource-v1_messages">message</a>

Stability: `prototype`

message apis

### <a name="link-GET-v1_messages-/v1/rooms/{room_id}/messages">message index</a>

Show a list of messages in a room.

```
GET /v1/rooms/{room_id}/messages
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/rooms/$ROOM_ID/messages
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
    "text": "Pig Coin is awesome.",
    "user_id": 1234,
    "room_id": 12
  }
]
```

### <a name="link-GET-v1_messages-/v1/messages/{id}">message show</a>

Show a specific message

```
GET /v1/messages/{id}
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/messages/$ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 1,
  "text": "Pig Coin is awesome.",
  "user_id": 1234,
  "room_id": 12
}
```

### <a name="link-POST-v1_messages-/v1/messages/">message create</a>

create message

```
POST /v1/messages/
```


#### Curl Example

```bash
$ curl -n -X POST http://coinnow.local/v1/messages/ \
  -d '{
  "id": 1,
  "text": "Pig Coin is awesome.",
  "user_id": 1234,
  "room_id": 12
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
  "user_id": 1234,
  "room_id": 12
}
```

### <a name="link-DELETE-v1_messages-/v1/messages/{id}">message delete</a>

update message

```
DELETE /v1/messages/{id}
```


#### Curl Example

```bash
$ curl -n -X DELETE http://coinnow.local/v1/messages/$ID \
  -d '{
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 202 Accepted
```



## <a name="resource-v1_posts">post</a>

Stability: `prototype`

post apis

### <a name="link-GET-v1_posts-/v1/posts">post index</a>

Show a list of post.

```
GET /v1/posts
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/posts
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
    "text": "Pig Coin is awesome.",
    "user_id": 1234
  }
]
```

### <a name="link-GET-v1_posts-/v1/posts/{id}">post show</a>

Show a specific post

```
GET /v1/posts/{id}
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/posts/$ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 1,
  "text": "Pig Coin is awesome.",
  "user_id": 1234
}
```

### <a name="link-POST-v1_posts-/v1/posts/">post create</a>

create post

```
POST /v1/posts/
```


#### Curl Example

```bash
$ curl -n -X POST http://coinnow.local/v1/posts/ \
  -d '{
  "id": 1,
  "text": "Pig Coin is awesome.",
  "user_id": 1234
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
  "user_id": 1234
}
```

### <a name="link-PATCH-v1_posts-/v1/posts/{id}">post update</a>

update post

```
PATCH /v1/posts/{id}
```


#### Curl Example

```bash
$ curl -n -X PATCH http://coinnow.local/v1/posts/$ID \
  -d '{
  "id": 1,
  "text": "Pig Coin is awesome.",
  "user_id": 1234
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
  "text": "Pig Coin is awesome.",
  "user_id": 1234
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



## <a name="resource-v1_tags">tag</a>

Stability: `prototype`

tag apis

### <a name="link-GET-v1_tags-/v1/tags">tag index</a>

Show a list of tag.

```
GET /v1/tags
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/tags
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
    "name": "pigcoin"
  }
]
```

### <a name="link-GET-v1_tags-/v1/tags/{tag_id}/posts">tag show</a>

Show a specific tag's posts

```
GET /v1/tags/{tag_id}/posts
```


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/tags/$TAG_ID/posts
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
    "user_id": 1234
  }
]
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
    "name": "kamexx",
    "image_data": "example",
    "email": "username@example.com",
    "password": "letmein1234"
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
  "name": "kamexx",
  "image_data": "example",
  "email": "username@example.com",
  "password": "letmein1234"
}
```

### <a name="link-POST-v1_users-/v1/users/">user create</a>

create user

```
POST /v1/users/
```


#### Curl Example

```bash
$ curl -n -X POST http://coinnow.local/v1/users/ \
  -d '{
  "id": 1,
  "name": "kamexx",
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
  "name": "kamexx",
  "image_data": "example",
  "email": "username@example.com",
  "password": "letmein1234"
}
```

### <a name="link-PATCH-v1_users-/v1/users/{id}">user update</a>

update user

```
PATCH /v1/users/{id}
```


#### Curl Example

```bash
$ curl -n -X PATCH http://coinnow.local/v1/users/$ID \
  -d '{
  "id": 1,
  "name": "kamexx",
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
  "name": "kamexx",
  "image_data": "example",
  "email": "username@example.com",
  "password": "letmein1234"
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


#### Curl Example

```bash
$ curl -n http://coinnow.local/v1/users/$USER_ID/posts
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
    "text": "Pig Coin is awesome.",
    "user_id": 1234
  }
]
```


