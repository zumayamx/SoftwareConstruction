/* Function to convert a string to hacker speak */
function toHackerSpeak (str) {
    for (let i = 0; i < str.length; i++) {
        if (str[i] == 'a') {
            str = str.replace('a', '4');
        } else if (str[i] == 'e') {
            str = str.replace('e', '3');
        } else if (str[i] == 'i') {
            str = str.replace('i', '1');
        } else if (str[i] == 'o') {
            str = str.replace('o', '0');
        } else if (str[i] == 's') {
            str = str.replace('s', '5');
        }
    }
    return str;
} 

const string = 'Javascript es divertido';
console.log('La cadena en hacker speak es: ', toHackerSpeak(string)); 

const string2 = 'Hola mundo';
console.log('La cadena en hacker speak es: ', toHackerSpeak(string2));

const string3 = 'Esto es una prueba interesante';
console.log('La cadena en hacker speak es: ', toHackerSpeak(string3));