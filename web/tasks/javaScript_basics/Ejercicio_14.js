/* Function to compute if a number is a power of two */
function isPowerOfTwo(n) {
    if (n === 0) {
        return false;
    }
    while (n !== 1) {
        if (n % 2 !== 0) { /* If the number is not divisible by 2, it is not a power of two */
            return false;
        }
        n = n / 2;
    }
    return true;
}

console.log(isPowerOfTwo(2147483648)); 
console.log(isPowerOfTwo(536870913)); 
console.log(isPowerOfTwo(1));