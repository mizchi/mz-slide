# mz-slide

Author: @mizchi

## Usage

Press left/right to prev/next

-------

## How to start

```
$ git@github.com:mizchi/mz-slide.git
$ cd mz-slide
$ npm install -g gulp
$ npm install
$ gulp
```

open assets/index.html

-------

## Edit your slide.md

- Wirte your slide by markdown
- Rendered slide is splited by `\-\-\-`

-------

## Develop your own slide

```
$ gulp watch
```

watch src/ and compile to assets/

you can edit

```
slide.md
src/
  - index.coffee
  - style.scss
```

-------

## How to deploy

```
# Create your repo
$ hub create your/repo
$ git push origin master
$ sh deploy.sh
```

-------

## Enjoy!
