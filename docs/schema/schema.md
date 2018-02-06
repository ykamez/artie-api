# The table of contents
  - <a href="#resource-article">Article</a>
  - <a href="#resource-hashtag">Hashtag</a>
  - <a href="#resource-paging">paging</a>
  - <a href="#resource-review">Post</a>
  - <a href="#resource-review_evaluation">Post Evaluation</a>
  - <a href="#resource-user">User</a>
  - <a href="#resource-v1_articles">article</a>
    - <a href="#link-GET-v1_articles-/v1/articles">GET /v1/articles</a>
    - <a href="#link-GET-v1_articles-/v1/articles/trend">GET /v1/articles/trend</a>
    - <a href="#link-GET-v1_articles-/v1/articles/{id}">GET /v1/articles/{id}</a>
    - <a href="#link-GET-v1_articles-/v1/articles/{id}/reviews">GET /v1/articles/{id}/reviews</a>
    - <a href="#link-POST-v1_articles-/v1/articles">POST /v1/articles</a>
    - <a href="#link-DELETE-v1_articles-/v1/articles/{id}">DELETE /v1/articles/{id}</a>
  - <a href="#resource-v1_hashtags">Hashtag</a>
    - <a href="#link-GET-v1_hashtags-/v1/hashtags">GET /v1/hashtags</a>
    - <a href="#link-GET-v1_hashtags-/v1/hashtags/{hashtag_id}/reviews">GET /v1/hashtags/{hashtag_id}/reviews</a>
  - <a href="#resource-v1_hashtags_trends">トレンド</a>
    - <a href="#link-GET-v1_hashtags_trends-/v1/hashtags/trends">GET /v1/hashtags/trends</a>
  - <a href="#resource-v1_reviews">review</a>
    - <a href="#link-POST-v1_reviews-/v1/articles/{id}/reviews">POST /v1/articles/{id}/reviews</a>
    - <a href="#link-DELETE-v1_reviews-/v1/reviews/{review_id}">DELETE /v1/reviews/{review_id}</a>
  - <a href="#resource-v1_reviews_reaction">reaction</a>
    - <a href="#link-POST-v1_reviews_reaction-/v1/reviews/{review_id}/like">POST /v1/reviews/{review_id}/like</a>
    - <a href="#link-DELETE-v1_reviews_reaction-/v1/reviews/{review_id}/like">DELETE /v1/reviews/{review_id}/like</a>
  - <a href="#resource-v1_reviews_search_result">search_result</a>
    - <a href="#link-GET-v1_reviews_search_result-/v1/reviews/search_result">GET /v1/reviews/search_result</a>
  - <a href="#resource-v1_search">search</a>
    - <a href="#link-GET-v1_search-/v1/search">GET /v1/search</a>
  - <a href="#resource-v1_users">user</a>
    - <a href="#link-GET-v1_users-/v1/users/{id}">GET /v1/users/{id}</a>
    - <a href="#link-GET-v1_users-/v1/users/me">GET /v1/users/me</a>
    - <a href="#link-POST-v1_users-/v1/users/">POST /v1/users/</a>
    - <a href="#link-PATCH-v1_users-/v1/users/{id}">PATCH /v1/users/{id}</a>
    - <a href="#link-DELETE-v1_users-/v1/users/{id}">DELETE /v1/users/{id}</a>
  - <a href="#resource-v1_users_follow_follwers">follow and followers</a>
    - <a href="#link-GET-v1_users_follow_follwers-/v1/users/{user_id}/following">GET /v1/users/{user_id}/following</a>
    - <a href="#link-GET-v1_users_follow_follwers-/v1/users/{user_id}/followers">GET /v1/users/{user_id}/followers</a>
  - <a href="#resource-v1_users_hashtag">user hashtag</a>
    - <a href="#link-GET-v1_users_hashtag-/v1/users/{user_id}/hashtags/watching">GET /v1/users/{user_id}/hashtags/watching</a>
  - <a href="#resource-v1_users_reactions">特定ユーザーのリアクション</a>
    - <a href="#link-GET-v1_users_reactions-/v1/users/{user_id}/reactions">GET /v1/users/{user_id}/reactions</a>
  - <a href="#resource-v1_users_reviews">特定ユーザーの投稿</a>
    - <a href="#link-GET-v1_users_reviews-/v1/users/{user_id}/reviews">GET /v1/users/{user_id}/reviews</a>
  - <a href="#resource-v1_users_search_result">search_result</a>
    - <a href="#link-GET-v1_users_search_result-/v1/users/search">GET /v1/users/search</a>
  - <a href="#resource-v1_users_user_evaluation">ユーザー評価</a>
    - <a href="#link-GET-v1_users_user_evaluation-/v1/users/{user_id}/user_evaluation">GET /v1/users/{user_id}/user_evaluation</a>
 
## <a name="resource-article">Article</a>

Stability: `prototype`

Article Resource


## <a name="resource-hashtag">Hashtag</a>

Stability: `prototype`

Post has many hashtags.


## <a name="resource-paging">paging</a>

Stability: `prototype`

Paging Resource


## <a name="resource-review">Post</a>

Stability: `prototype`

Post Resource


## <a name="resource-review_evaluation">Post Evaluation</a>

Stability: `prototype`

Post Evaluation Resource


## <a name="resource-user">User</a>

Stability: `prototype`

User Resource


## <a name="resource-v1_articles">article</a>

Stability: `prototype`

article apis

### <a name="link-GET-v1_articles-/v1/articles">article index</a>

Show a list of article.

```
GET /v1/articles
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://artie.local/v1/articles
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "data": [
    {
      "id": 1,
      "url": "https://github.com/.",
      "image_url": "https://hogehoge.png",
      "title": "Github",
      "published_at": "2015-01-01T12:00:00Z",
      "reviews_count": 100,
      "average_rating": "5.0",
      "categories": [
        {
          "id": 1,
          "name": "BTC"
        }
      ]
    }
  ],
  "paging": {
    "cursor": null,
    "has_next": true
  },
  "message": "success!!"
}
```

### <a name="link-GET-v1_articles-/v1/articles/trend">article trend</a>

Show a list of trend article.

```
GET /v1/articles/trend
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://artie.local/v1/articles/trend
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "data": [
    {
      "id": 1,
      "url": "https://github.com/.",
      "image_url": "https://hogehoge.png",
      "title": "Github",
      "published_at": "2015-01-01T12:00:00Z",
      "reviews_count": 100,
      "average_rating": "5.0",
      "categories": [
        {
          "id": 1,
          "name": "BTC"
        }
      ]
    }
  ],
  "paging": {
    "cursor": null,
    "has_next": true
  },
  "message": "success!!"
}
```

### <a name="link-GET-v1_articles-/v1/articles/{id}">article 記事の詳細表示</a>

記事の詳細

```
GET /v1/articles/{id}
```


#### Curl Example

```bash
$ curl -n http://artie.local/v1/articles/$ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 1,
  "url": "https://github.com/.",
  "image_url": "https://hogehoge.png",
  "title": "Github",
  "published_at": "2015-01-01T12:00:00Z",
  "reviews_count": 100,
  "average_rating": "5.0",
  "categories": [
    {
      "id": 1,
      "name": "BTC"
    }
  ]
}
```

### <a name="link-GET-v1_articles-/v1/articles/{id}/reviews">article 記事のコメント表示</a>

投稿のモーダルのリプライ情報を追加も合わせて取得する。

```
GET /v1/articles/{id}/reviews
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://artie.local/v1/articles/$ID/reviews
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "replies": {
    "data": [
      {
        "id": 1,
        "text": "Pig Coin is awesome.",
        "user": {
          "id": 1,
          "full_name": "Bob Tarou",
          "image_url": "example",
          "total_likes_count": 123,
          "followings_count": 10,
          "followers_count": 30,
          "evaluation_point": 2.5
        },
        "posted_at": "2015-01-01T12:00:00Z",
        "likes_count": 100,
        "rating": 2.4,
        "is_liked": false
      }
    ],
    "paging": {
      "cursor": null,
      "has_next": true
    },
    "message": "success!!"
  }
}
```

### <a name="link-POST-v1_articles-/v1/articles">article create</a>

ページの右上からピックするときはこれを叩く。既にピックされていた場合は、getして返すことになる。ピックされた記事にコメントする際は、`review /v1/articles/:id/reviews`を叩いてもらう。レスポンスで記事を返すべきか、コメントを返すべきか迷いどころ。(TODO)

```
POST /v1/articles
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **rating** | *string* | unique identifier of user | `"2.5"` |
| **url** | *string* | article's url | `"xxx"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **text** | *string* | article's review's text | `"nice"` |


#### Curl Example

```bash
$ curl -n -X POST http://artie.local/v1/articles \
  -d '{
  "url": "xxx",
  "text": "nice",
  "rating": "2.5"
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
    "full_name": "Bob Tarou",
    "image_url": "example",
    "total_likes_count": 123,
    "followings_count": 10,
    "followers_count": 30,
    "evaluation_point": 2.5
  },
  "posted_at": "2015-01-01T12:00:00Z",
  "likes_count": 100,
  "rating": 2.4,
  "is_liked": false
}
```

### <a name="link-DELETE-v1_articles-/v1/articles/{id}">article delete</a>

実装するか判断延期。NewsPicksでは、バグとして残っている模様。

```
DELETE /v1/articles/{id}
```


#### Curl Example

```bash
$ curl -n -X DELETE http://artie.local/v1/articles/$ID \
  -d '{
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 202 Accepted
```



## <a name="resource-v1_hashtags">Hashtag</a>

Stability: `prototype`

記事のカテゴリーを表すくくりとして使われる予定。

### <a name="link-GET-v1_hashtags-/v1/hashtags">Hashtag index</a>

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
$ curl -n http://artie.local/v1/hashtags
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "data": [
    {
      "id": 1,
      "name": "BTC"
    }
  ],
  "paging": {
    "cursor": null,
    "has_next": true
  },
  "message": "success!!"
}
```

### <a name="link-GET-v1_hashtags-/v1/hashtags/{hashtag_id}/reviews">Hashtag show</a>

Show a specific hashtag's reviews

```
GET /v1/hashtags/{hashtag_id}/reviews
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://artie.local/v1/hashtags/$HASHTAG_ID/reviews
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "data": [
    {
      "id": 1,
      "text": "Pig Coin is awesome.",
      "user": {
        "id": 1,
        "full_name": "Bob Tarou",
        "image_url": "example",
        "total_likes_count": 123,
        "followings_count": 10,
        "followers_count": 30,
        "evaluation_point": 2.5
      },
      "posted_at": "2015-01-01T12:00:00Z",
      "likes_count": 100,
      "rating": 2.4,
      "is_liked": false
    }
  ],
  "paging": {
    "cursor": null,
    "has_next": true
  },
  "message": "success!!"
}
```


## <a name="resource-v1_hashtags_trends">トレンド</a>

Stability: `prototype`

トレンドに関するAPI

### <a name="link-GET-v1_hashtags_trends-/v1/hashtags/trends">トレンド トレンド</a>

直近一時間で投稿数が多かったカテゴリーの名前、投稿数、人数を返す。

```
GET /v1/hashtags/trends
```


#### Curl Example

```bash
$ curl -n http://artie.local/v1/hashtags/trends
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "data": [
    {
      "hashtag": {
        "id": 1,
        "name": "BTC"
      },
      "people_count": 350,
      "reviews_count": 840
    }
  ]
}
```


## <a name="resource-v1_reviews">review</a>

Stability: `prototype`

記事につく、コメント。

### <a name="link-POST-v1_reviews-/v1/articles/{id}/reviews">review create</a>

create review

```
POST /v1/articles/{id}/reviews
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **text** | *nullable string* | review's text | `"Pig Coin is awesome."` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **evaluation_point** | *string* | evaluation rating | `2.4` |


#### Curl Example

```bash
$ curl -n -X POST http://artie.local/v1/articles/$ID/reviews \
  -d '{
  "text": "Pig Coin is awesome.",
  "evaluation_point": 2.4
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
    "full_name": "Bob Tarou",
    "image_url": "example",
    "total_likes_count": 123,
    "followings_count": 10,
    "followers_count": 30,
    "evaluation_point": 2.5
  },
  "posted_at": "2015-01-01T12:00:00Z",
  "likes_count": 100,
  "rating": 2.4,
  "is_liked": false
}
```

### <a name="link-DELETE-v1_reviews-/v1/reviews/{review_id}">review delete</a>

update review

```
DELETE /v1/reviews/{review_id}
```


#### Curl Example

```bash
$ curl -n -X DELETE http://artie.local/v1/reviews/$REVIEW_ID \
  -d '{
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 202 Accepted
```



## <a name="resource-v1_reviews_reaction">reaction</a>

Stability: `prototype`

reaction apis

### <a name="link-POST-v1_reviews_reaction-/v1/reviews/{review_id}/like">reaction like</a>

like a review

```
POST /v1/reviews/{review_id}/like
```


#### Curl Example

```bash
$ curl -n -X POST http://artie.local/v1/reviews/$REVIEW_ID/like \
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
    "full_name": "Bob Tarou",
    "image_url": "example",
    "total_likes_count": 123,
    "followings_count": 10,
    "followers_count": 30,
    "evaluation_point": 2.5
  },
  "posted_at": "2015-01-01T12:00:00Z",
  "likes_count": 100,
  "rating": 2.4,
  "is_liked": false
}
```

### <a name="link-DELETE-v1_reviews_reaction-/v1/reviews/{review_id}/like">reaction cancel like</a>

remove like

```
DELETE /v1/reviews/{review_id}/like
```


#### Curl Example

```bash
$ curl -n -X DELETE http://artie.local/v1/reviews/$REVIEW_ID/like \
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
  "user": {
    "id": 1,
    "full_name": "Bob Tarou",
    "image_url": "example",
    "total_likes_count": 123,
    "followings_count": 10,
    "followers_count": 30,
    "evaluation_point": 2.5
  },
  "posted_at": "2015-01-01T12:00:00Z",
  "likes_count": 100,
  "rating": 2.4,
  "is_liked": false
}
```


## <a name="resource-v1_reviews_search_result">search_result</a>

Stability: `prototype`

get search_result apis

### <a name="link-GET-v1_reviews_search_result-/v1/reviews/search_result">search_result search_result</a>

get a review's search_result

```
GET /v1/reviews/search_result
```


#### Curl Example

```bash
$ curl -n http://artie.local/v1/reviews/search_result
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "data": [
    {
      "id": 1,
      "text": "Pig Coin is awesome.",
      "user": {
        "id": 1,
        "full_name": "Bob Tarou",
        "image_url": "example",
        "total_likes_count": 123,
        "followings_count": 10,
        "followers_count": 30,
        "evaluation_point": 2.5
      },
      "posted_at": "2015-01-01T12:00:00Z",
      "likes_count": 100,
      "rating": 2.4,
      "is_liked": false
    }
  ],
  "paging": {
    "cursor": null,
    "has_next": true
  },
  "message": "success!!"
}
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
$ curl -n http://artie.local/v1/search
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
      "full_name": "Bob Tarou",
      "image_url": "example",
      "total_likes_count": 123,
      "followings_count": 10,
      "followers_count": 30,
      "evaluation_point": 2.5
    }
  ],
  "hashtags": [
    {
      "id": 1,
      "name": "BTC"
    }
  ]
}
```


## <a name="resource-v1_users">user</a>

Stability: `prototype`

user apis

### <a name="link-GET-v1_users-/v1/users/{id}">user show from other</a>

Show a specific user

```
GET /v1/users/{id}
```


#### Curl Example

```bash
$ curl -n http://artie.local/v1/users/$ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 1,
  "full_name": "Bob Tarou",
  "image_url": "example",
  "total_likes_count": 123,
  "followings_count": 10,
  "followers_count": 30,
  "evaluation_point": 2.5
}
```

### <a name="link-GET-v1_users-/v1/users/me">user me</a>

Show my user inform

```
GET /v1/users/me
```


#### Curl Example

```bash
$ curl -n http://artie.local/v1/users/me
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 1,
  "full_name": "Bob Tarou",
  "image_url": "example",
  "total_likes_count": 123,
  "followings_count": 10,
  "followers_count": 30,
  "evaluation_point": 2.5
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
| **email** | *email* | user email address | `"username@example.com"` |
| **full_name** | *string* | full full_name of user | `"Bob Tarou"` |
| **password** | *string* | user password | `"letmein1234"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **image_url** | *string* | user's icon | `"example"` |


#### Curl Example

```bash
$ curl -n -X POST http://artie.local/v1/users/ \
  -d '{
  "full_name": "Bob Tarou",
  "image_url": "example",
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
  "full_name": "Bob Tarou",
  "image_url": "example",
  "total_likes_count": 123,
  "followings_count": 10,
  "followers_count": 30,
  "evaluation_point": 2.5
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
| **email** | *email* | user email address | `"username@example.com"` |
| **full_name** | *string* | full full_name of user | `"Bob Tarou"` |
| **password** | *string* | user password | `"letmein1234"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **image_url** | *string* | user's icon | `"example"` |


#### Curl Example

```bash
$ curl -n -X PATCH http://artie.local/v1/users/$ID \
  -d '{
  "full_name": "Bob Tarou",
  "image_url": "example",
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
  "full_name": "Bob Tarou",
  "image_url": "example",
  "total_likes_count": 123,
  "followings_count": 10,
  "followers_count": 30,
  "evaluation_point": 2.5
}
```

### <a name="link-DELETE-v1_users-/v1/users/{id}">user delete</a>

update user

```
DELETE /v1/users/{id}
```


#### Curl Example

```bash
$ curl -n -X DELETE http://artie.local/v1/users/$ID \
  -d '{
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 202 Accepted
```



## <a name="resource-v1_users_follow_follwers">follow and followers</a>

Stability: `prototype`

follow followers apis

### <a name="link-GET-v1_users_follow_follwers-/v1/users/{user_id}/following">follow and followers a user's following users</a>

Show a list of a following users

```
GET /v1/users/{user_id}/following
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://artie.local/v1/users/$USER_ID/following
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "data": [
    {
      "id": 1,
      "full_name": "Bob Tarou",
      "image_url": "example",
      "total_likes_count": 123,
      "followings_count": 10,
      "followers_count": 30,
      "evaluation_point": 2.5
    }
  ],
  "paging": {
    "cursor": null,
    "has_next": true
  },
  "message": "success!!"
}
```

### <a name="link-GET-v1_users_follow_follwers-/v1/users/{user_id}/followers">follow and followers a user's following users</a>

Show a list of a followers users

```
GET /v1/users/{user_id}/followers
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://artie.local/v1/users/$USER_ID/followers
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "data": [
    {
      "id": 1,
      "full_name": "Bob Tarou",
      "image_url": "example",
      "total_likes_count": 123,
      "followings_count": 10,
      "followers_count": 30,
      "evaluation_point": 2.5
    }
  ],
  "paging": {
    "cursor": null,
    "has_next": true
  },
  "message": "success!!"
}
```


## <a name="resource-v1_users_hashtag">user hashtag</a>

Stability: `prototype`

user hashtag apis

### <a name="link-GET-v1_users_hashtag-/v1/users/{user_id}/hashtags/watching">user hashtag user's favorites hashtags</a>

Show a list of a user's favorites hashtags.

```
GET /v1/users/{user_id}/hashtags/watching
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://artie.local/v1/users/$USER_ID/hashtags/watching
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "data": [
    {
      "id": 1,
      "name": "BTC"
    }
  ],
  "paging": {
    "cursor": null,
    "has_next": true
  }
}
```


## <a name="resource-v1_users_reactions">特定ユーザーのリアクション</a>

Stability: `prototype`

特定ユーザーのリアクション

### <a name="link-GET-v1_users_reactions-/v1/users/{user_id}/reactions">特定ユーザーのリアクション user's reactions</a>

Show a list of a user's reactions

```
GET /v1/users/{user_id}/reactions
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://artie.local/v1/users/$USER_ID/reactions
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "data": [
    {
      "id": 1,
      "text": "Pig Coin is awesome.",
      "user": {
        "id": 1,
        "full_name": "Bob Tarou",
        "image_url": "example",
        "total_likes_count": 123,
        "followings_count": 10,
        "followers_count": 30,
        "evaluation_point": 2.5
      },
      "posted_at": "2015-01-01T12:00:00Z",
      "likes_count": 100,
      "rating": 2.4,
      "is_liked": false
    }
  ],
  "paging": {
    "cursor": null,
    "has_next": true
  },
  "message": "success!!"
}
```


## <a name="resource-v1_users_reviews">特定ユーザーの投稿</a>

Stability: `prototype`

特定ユーザーの投稿に関するAPI

### <a name="link-GET-v1_users_reviews-/v1/users/{user_id}/reviews">特定ユーザーの投稿 user's reviews</a>

Show a list of a user's reviews

```
GET /v1/users/{user_id}/reviews
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **cursor** | *string* | datetime |  |
| **limit** | *integer* | limit | `10` |


#### Curl Example

```bash
$ curl -n http://artie.local/v1/users/$USER_ID/reviews
 -G \
  -d limit=10
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "data": [
    {
      "id": 1,
      "text": "Pig Coin is awesome.",
      "user": {
        "id": 1,
        "full_name": "Bob Tarou",
        "image_url": "example",
        "total_likes_count": 123,
        "followings_count": 10,
        "followers_count": 30,
        "evaluation_point": 2.5
      },
      "posted_at": "2015-01-01T12:00:00Z",
      "likes_count": 100,
      "rating": 2.4,
      "is_liked": false
    }
  ],
  "paging": {
    "cursor": null,
    "has_next": true
  },
  "message": "success!!"
}
```


## <a name="resource-v1_users_search_result">search_result</a>

Stability: `prototype`

get search_result apis

### <a name="link-GET-v1_users_search_result-/v1/users/search">search_result search_result</a>

get a user's search

```
GET /v1/users/search
```


#### Curl Example

```bash
$ curl -n http://artie.local/v1/users/search
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "data": [
    {
      "id": 1,
      "full_name": "Bob Tarou",
      "image_url": "example",
      "total_likes_count": 123,
      "followings_count": 10,
      "followers_count": 30,
      "evaluation_point": 2.5
    }
  ],
  "paging": {
    "cursor": null,
    "has_next": true
  },
  "message": "success!!"
}
```


## <a name="resource-v1_users_user_evaluation">ユーザー評価</a>

Stability: `prototype`

ユーザー評価に関するAPI

### <a name="link-GET-v1_users_user_evaluation-/v1/users/{user_id}/user_evaluation">ユーザー評価 ユーザー評価</a>

ユーザー評価の内訳を返す

```
GET /v1/users/{user_id}/user_evaluation
```


#### Curl Example

```bash
$ curl -n http://artie.local/v1/users/$USER_ID/user_evaluation
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "total_count_likes": 1248
}
```


