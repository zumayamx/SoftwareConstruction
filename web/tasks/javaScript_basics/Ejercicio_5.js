/* Function to compute the MCD of a two numbers */
function MCD(a, b) {
    if (b === 0) {
        return a;
    } else {
        return MCD(b, a % b);
    }
}

const a = 12;
const b = 27;
console.log('El MCD de ', a, ' y ', b, ' es: ', MCD(a, b)); 

const a2 = 15;
const b2 = 25;
console.log('El MCD de ', a2, ' y ', b2, ' es: ', MCD(a2, b2));

const a3 = 100;
const b3 = 200;
console.log('El MCD de ', a3, ' y ', b3, ' es: ', MCD(a3, b3));