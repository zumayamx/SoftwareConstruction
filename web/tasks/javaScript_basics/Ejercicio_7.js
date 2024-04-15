/* Function to compute the factors of a number */
function factors(n) {
    let i;
    for (i = 1; i <= n; i++) {
        if (n % i === 0) { /* If the number is divisible by i, print i as factor */
            console.log(i + " ");
        }
    }
}

const number = 21;
console.log('Los factores de ', number, ' son: ' );
factors(number);

const number2 = 100;
console.log('Los factores de ', number2, ' son: ' );
factors(number2);

const number3 = 1000;
console.log('Los factores de ', number3, ' son: ' );
factors(number3);