# QiitaAPIKit
[![BuildStatus](https://github.com/ry-itto/QiitaAPIKit/workflows/push_on_master/badge.svg)](https://github.com/ry-itto/QiitaAPIKit/actions?workflow=push_on_master)

library for [Qiita API](https://qiita.com/api/v2/docs).

## Installation
### SwiftPM
#### Using Xcode 11.x
- Click '+' button
<img width="610" alt="スクリーンショット 2019-12-06 14 31 55" src="https://user-images.githubusercontent.com/30540303/70298497-33d2ae80-1835-11ea-9778-0a2948d86ef7.png">

- Put this repository's URL(`https://github.com/ry-itto/QiitaAPIKit`)
<img width="734" alt="スクリーンショット 2019-12-06 14 33 21" src="https://user-images.githubusercontent.com/30540303/70298561-62e92000-1835-11ea-83f1-c3b5ecfa97d4.png">

- Click `Next` two times, and click finish.

### Cocoapods
add `pod 'QiitaAPIKit'` to your Podfile.

## Supported APIs
|Endpoint|HTTP Method|struct|
|--|--|--|
|`/api/v2/items`|GET|`ArticleRequest`|
|`/api/v2/items/:item_id/comments`|GET|`ArticleCommentRequest`|
|`/api/v2/items/:item_id/likes`|GET|`ArticleLikesRequest`|
|`/api/v2/items/:item_id/stockers`|GET|`ArticleStockersRequest`|
|`/api/v2/tags`|GET|`TagRequest`|

## How to Login
1. Initialize struct of `Auth` with `client_id`, `client_secret`, `redirect_url`, and `scope`.
2. Use `showLoginView()` function.
※ Before using Login, adopt protocol `QiitaAPIKitAuthDelegate`.

## To increase limit of API request
Set `access_token` to Initializer.
