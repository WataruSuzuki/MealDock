function upperCaseFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

function lowerCaseAllWordsExceptFirstLetters(string) {
    return string.replace(/\w\S*/g, function (word) {
        return word.charAt(0) + word.slice(1).toLowerCase();
    });
}

function reformat(propertyName) {
  function upperToHyphenLower(match, offset, string) {
    return match.toUpperCase().replace(/_/gi, ' ');
  }
  return propertyName.replace(/_[a-z]/g, upperToHyphenLower);
}

var fs = require("fs")
    , path = require("path")
    , dir = process.argv[2] || '.'; //引数が無いときはカレントディレクトリを対象とする

var walk = function(p, fileCallback, errCallback) {

    fs.readdir(p, function(err, files) {
        if (err) {
            errCallback(err);
            return;
        }

        files.forEach(function(f) {
            var fp = path.join(p, f); // to full-path
            if(fs.statSync(fp).isDirectory()) {
                walk(fp, fileCallback);
            } else {
				var filename = path.basename(f, path.extname(f))
				var desiredOutput = upperCaseFirstLetter(lowerCaseAllWordsExceptFirstLetters(filename));
                fileCallback(filename + " = \"" + reformat(desiredOutput) + "\";"); // ファイルならコールバックで通知
				// fileCallback(filename + " = \"" + desiredOutput.replace(/_/gi, ' ') + "\";"); // ファイルならコールバックで通知
            }
        });
    });
};



// 使う方
walk(dir, function(path) {
    console.log(path); // ファイル１つ受信
}, function(err) {
    console.log("Receive err:" + err); // エラー受信
});
