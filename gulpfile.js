var gulp = require('gulp');
var htmlmin = require('gulp-htmlmin');
var htmlclean = require('gulp-htmlclean');

gulp.task('minify-html', function() {
    return gulp.src('./public/**/*.html')
        .pipe(htmlmin({
            removeComments: true,
            minifyJS: true,
            minifyCSS: true,
            collapseWhitespace: true,
            sortAttributes: true,
            sortClassName: true,
            processScripts: ["application/ld+json"]
        }))
        .pipe(htmlclean({
            unprotect: [
                /<script [^>]*\btype="application\/ld\+json"[\s\S]+?<\/script>/ig,
            ]
        }))
        .pipe(gulp.dest('./public'))
});

gulp.task('default', gulp.parallel('minify-html'));