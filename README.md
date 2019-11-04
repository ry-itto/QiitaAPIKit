# QiitaAPIKit
[![BuildStatus](https://github.com/ry-itto/QiitaAPIKit/workflows/push_on_master/badge.svg)](https://github.com/ry-itto/QiitaAPIKit/actions?workflow=push_on_master)

library for [Qiita API](https://qiita.com/api/v2/docs).

## Supported APIs
|End point|HTTP Method|struct|
|--|--|--|
|`/api/v2/items`|GET|`ArticleRequest`|
|`/api/v2/items/:item_id/comments`|GET|`ArticleCommentRequest`|
|`/api/v2/items/:item_id/likes`|GET|`ArticleLikesRequest`|
|`/api/v2/items/:item_id/stockers`|GET|`ArticleStockersRequest`|
|`/api/v2/tags`|GET|`TagRequest`|

