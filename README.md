Exswift
=======

Swift client for Elixir (in development). Based on [NightCrawler Swift](https://github.com/tulios/nightcrawler_swift).

Usage
-----

    access = ExSwift.Auth.auth "http://auth-url.com/"
    books = access |> ExSwift.Container.list "library-container"
