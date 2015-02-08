var gulp = require('gulp');
var server = require('gulp-express');
var coffee = require('gulp-coffee');
var gutil = require('gutil');

var browserify = require('gulp-browserify');
var rename = require('gulp-rename');

var gulpThatShit = function() {
    console.log("browserify compile")

    gulp.src('src/client.coffee', { read: false })
        .pipe(browserify({
          extensions: ['.coffee'],
          // Remove this option in a production compile
          // will make the file twice as big.
          debug: true
        }))
        .pipe(rename('main.js'))
        .pipe(gulp.dest('./dist'))

    console.log("coffee compile")

    gulp.src('./src/*.coffee')
      .pipe(coffee({bare: true}).on('error', gutil.log))
      .pipe(gulp.dest('./dist'))
    server.run({
        file: 'dist/app.js',
        args: '--debug port 5858'
    });

}

gulp.task('server', function () {
    gulpThatShit()
    // Start the server at the beginning of the task
    gulp.watch(['./src/**.coffee'], gulpThatShit);
    // gulp.watch(['dist/**/*.js'], ['jshint']);
    gulp.watch(['dist/*'], server.notify);
});
