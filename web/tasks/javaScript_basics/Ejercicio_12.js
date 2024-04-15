/* Function to find the mean and mode of a list of numbers */
function meanAndMode(list) {
    let occurrences = {}; /* Create a map to save the occurrences of each number in the list */
    let mean = 0;
    let mode = 0;

    for (let i = 0; i < list.length; i++) {
        let number = list[i];
        mean += number;
        if (occurrences[number]) {
            occurrences[number]++;
        }
        else {
            occurrences[number] = 1;
        }
    }

    for (let i = 0; i < list.length; i++) {
        let number = list[i];
        if (occurrences[number] > mode) { /* If the number has more occurrences than the current mode, update the mode */
            mode = number;
        }
    }
    mean /= list.length;
    return {mean, mode};
}

const list = [1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 10];
console.log('La media y la moda de la lista son: ', meanAndMode(list)); 

const list2 = [1, 2, 2, 3, 7, 5, 6, 7, 8, 9, 9, 9, 9, 100, 10];
console.log('La media y la moda de la lista son: ', meanAndMode(list2));

const list3 = [1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 10];
console.log('La media y la moda de la lista son: ', meanAndMode(list3));