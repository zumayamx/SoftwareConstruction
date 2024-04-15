/* Function to find the most frequent string in a list */
function mostFrequencyString (list) {
    let occurrences = {};
    let mode = '';
    for (let i = 0; i < list.length; i++) {
        let word = list[i];
        if (occurrences[word]) {
            occurrences[word]++; /* If the word is in the map, increment its occurrences */
        }
        else {
            occurrences[word] = 1;
        }
    }
    let max = 0;
    for (let word in occurrences) { /* Iterate over the words of the map */
        if (occurrences[word] > max) { /* If the word has more occurrences than the current mode, update the mode */
            max = occurrences[word];
            mode = word;
        }
    }
    return mode;
}

const list = ['hola', 'mundo', 'hola', 'hola', 'mundo', 'mundo', 'mundo', 'hola', 'hola', 'mundo', 'hola', 'mundo', 'mundo', 'mundo', 'hola', 'hola', 'mundo']
console.log('La palabra más frecuente en la lista es: ', mostFrequencyString(list));

const list2 = ['luna', 'sol', 'luna', 'luna', 'sol', 'sol', 'sol', 'luna', 'luna', 'sol', 'luna', 'sol', 'sol', 'sol', 'luna', 'luna', 'sol'];
console.log('La palabra más frecuente en la lista es: ', mostFrequencyString(list2));

const list3 = ['perro', 'gato', 'perro', 'perro', 'gato', 'gato', 'gato', 'perro', 'perro', 'gato', 'perro', 'gato', 'gato', 'gato', 'perro', 'perro', 'gato', 'gato'];
console.log('La palabra más frecuente en la lista es: ', mostFrequencyString(list3));