const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

askIfGreaterThan = function (el1, el2, callback) {
  reader.question(`Is ${el1} > ${el2}? 'yes' or 'no'`, function (answer){
    if (answer.toLowerCase() === 'yes') {
      return callback(true);
    } else {
      return callback(false);
    }
  });
};

innerBubbleSortLoop = function (arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan) {
      if (isGreaterThan === true) {
        
        let flip = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = flip;

        madeAnySwaps = true;
      }

      return innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    
    });

  } else {
    // console.log(arr);
    return outerBubbleSortLoop(madeAnySwaps);
  }
};

function absurdBubbleSort(arr, sortCompletionCallback) {
  let madeAnySwaps = true;

  function outerBubbleSortLoop(madeAnySwaps){
    console.log(arr);
    if (madeAnySwaps === true){
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      return sortCompletionCallback(arr);
    }
  }

  outerBubbleSortLoop(madeAnySwaps);
}



let arr = [5,2,3,1,4];

absurdBubbleSort(arr, sorted => {
  console.log(`Here's your sorted array: ${sorted}`);
  reader.close();
});