const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

addNumbers = function (sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question("Please feed me number", function (answer) {

      let int = parseInt(answer, 10);
      
      sum += int;

      console.log(sum);
      
      addNumbers(sum, numsLeft - 1, completionCallback);
    });
    
    
  } else {
    return completionCallback(sum);
  }

};

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));