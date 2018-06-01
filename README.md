# block

A little tool for automatically blocking websites and urls from the command line.
It assumes there's a hostfile at `/etc/hosts`. If you're on macOS or most linux 
distros, then this should likely be the case for you already.

## Warning

Block is more/less meant to be a one-way tool. If you want to remove something from your block list, you'll need to open up your `/etc/hosts` file and remove the line at the the end of the file yourself. There is no `unblock xyz.com`.

## Installation



## Usage

```sh 
$ block distractingsite.com
```

## Contributing

1. Fork it ( https://github.com/flaque/block/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Flaque](https://github.com/flaque) Flaque - creator, maintainer
