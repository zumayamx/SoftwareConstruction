/* Function to check if a string is palindrome */
function isPalindrome(str) {
    str = str.replace(/ /g, '');
    let j = str.length - 1;
    for (let i = 0; i < str.length; i++) {
        if (str[i] != str[j]) {
            return false;
        }
        j--; /* Decrement j to compare the next char */
    }
    return true;
}

const string = 'reconocer';
console.log('La cadena es palindroma: ', isPalindrome(string)); 

const string2 = 'hola';
console.log('La cadena es palindroma: ', isPalindrome(string2));

const string3 = 'anita lava la tina';
console.log('La cadena es palindroma: ', isPalindrome(string3));