//Arguments Demo

function adder(){
    let sum = 0;
    // console.log(arguments);
    let args = Array.from(arguments);
    // console.log(args)
    args.forEach((num) => {
        sum = sum + num;
    })
    return sum;
}

// console.log(adder(1, 2, 3))

function minFunc2(){
    console.log(Math.min(...arguments));
}
// minFunc2(25, 4, 8)

function adder(startingNumber, ...otherNums){
    let sum = startingNumber;
    console.log(`${startingNumber} is my startin number`);
    console.log(otherNums);
    otherNums.forEach((num) => {
        sum = sum + num;
    });

    return sum;
}

// console.log(adder(10, 3, 4, 6, 4))
// 27


function calc(callback, ...otherArgs){
    let result = callback(...otherArgs);
    console.log('result:', result);
}

// calc(adder, 10, 20, 30, 40);


const loadHomePage = function () {
    console.log("Starting page load");
    $.ajax(loadNavBar); // this is NOT proper syntax
    console.log("Waiting for nav");
    $.ajax(getProfilePic);
    console.log("Getting picture");
    $.ajax(loadPostFeed);
    console.log('Waiting for content');
    console.log('goodbye');
};
loadHomePage();
