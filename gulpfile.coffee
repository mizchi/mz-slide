gulp   = require 'gulp'
shell  = require 'gulp-shell'
sass   = require 'gulp-sass'

gulp.task 'default', ['build']
gulp.task 'build', [
  'build:browserify'
  'build:css'
]

gulp.task 'build:browserify', shell.task [
  "browserify -t coffeeify --extension='.coffee' -t brfs -t sassify -o assets/bundle.js src/index.coffee"
]

gulp.task 'build:css', ->
  gulp
    .src('src/style.scss')
    .pipe(sass())
    .pipe(gulp.dest('assets'))

gulp.task 'watch', ['build'], ->
  gulp.watch 'src/**/*.coffee', ['build:browserify']
  gulp.watch 'slide.md', ['build:browserify']
  gulp.watch 'src/**/*.scss', ['build:css']
