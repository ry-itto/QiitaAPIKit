# QiitaAPIKit
[![BuildStatus](https://github.com/ry-itto/QiitaAPIKit/workflows/push_on_master/badge.svg)](https://github.com/ry-itto/QiitaAPIKit/actions?workflow=push_on_master)

library for [Qiita API](https://qiita.com/api/v2/docs).

## Supported APIs
|End point|HTTP Method|function|
|--|--|--|
|`/api/v2/items`|GET|`fetchArticles`|
|`/api/v2/items/:item_id/likes`|GET|`fetchTags`|
|`/api/v2/items/:item_id/comments`|GET|`fetchArticleComments`|