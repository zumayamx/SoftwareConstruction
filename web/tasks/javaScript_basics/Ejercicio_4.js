/* Function to return the firt letter of each word */
function firstUpperCase(str) {
    let newStr = str[0].toUpperCase();
    for (let i = 0; i < str.length; i ++) {
        if (str[i] == ' ') { /* If the string == to space it means that continue new word  */
            newStr += str[i + 1].toUpperCase();
        }
    }
    return newStr;
}

const string = 'hola mundo como estan el dia de hoy';
console.log('La primera letra de cada palabra es: ', firstUpperCase(string)); 

const string2 = 'javascript es divertido';
console.log('La primera letra de cada palabra es: ', firstUpperCase(string2));

const string3 = 'buenas noches, hasta mañana';
console.log('La primera letra de cada palabra es: ', firstUpperCase(string3));