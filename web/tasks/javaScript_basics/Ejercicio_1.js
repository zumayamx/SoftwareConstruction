/* Function to find the first char that don´t repeat*/
function firstChar(string) {
    const charCount = {}; /*Creatre a map to save the concurrences of each char in string*/
    for (let i = 0; i < string.length; i++) {
        let char = string[i];
        if (charCount[char]) {
            charCount[char]++;
        }
        else {
            charCount[char] = 1; /*If the char is not in the map, add it with a value of 1*/
        }
    }

    for (let i = 0; i < string.length; i++) {
        let char = string[i];
        if (charCount[char] === 1) { /*If the char is in the map with a value of 1, return it*/
            return char;
        }
    }
    return null;
}

const string = 'abacddbec';
console.log('El primer caracter que no se repite es: ', firstChar(string)); 

const string2 = 'abacddbecfefr';
console.log('El primer caracter que no se repite es: ', firstChar(string2));

const string3 = 'abacddbecfghe';
console.log('El primer caracter que no se repite es: ', firstChar(string3));