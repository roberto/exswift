Exswift
=======

Swift client for Elixir (in development). Based on [NightCrawler Swift](https://github.com/tulios/nightcrawler_swift).

Usage
-----

    access = ExSwift.auth "http://auth-url.com/"

    access |> ExSwift.create_container "books"

