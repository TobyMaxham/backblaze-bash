# Backblaze B2 Storage API Scripts

A Backblaze library with some scripts to use the Backblaze B2 storage API, which includes the first 10GB of storage for free.

***Note:*** All scripts tested on Ubtunu. Other Distributions aren't tested, but will likely work.

**Requires:**
- curl
- openssl

## How to use

You can download/install all the scripts via git console. Also you can use the curl command to execute the files from remote source.

### curl
```sh
# call the upload script
curl -sSL https://raw.githubusercontent.com/TobyMaxham/backblaze-bash/master/b2upload | bash -s -- -h
```

### install via git
coming soon!


## License

The Backblaze Bash Scripts are open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).


## Related:

- https://www.backblaze.com/b2/docs/
  - https://www.backblaze.com/b2/docs/b2_get_upload_url.html
