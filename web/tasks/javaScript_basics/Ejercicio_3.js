/* Function to invert a list, this return a new list with the elements in reverse order */
function invert(list) {
    let newList = [];
    for (let i = list.length - 1; i >= 0; i--) {
        newList.push(list[i]);
    }
    return newList;
}

function modifyList(list) { /* Function to modify a list, this function swap the elements in pairs */
    let tmp;
    for (let i = 0; i < list.length - 1; i++) {
        tmp = list[i];
        list[i] = list[i + 1] * 2; /* Multiply the right element by 2 */
        list[i + 1] = tmp;
    }
}

/* Function to print a list */
function printList(list, size) {
    let i;
    for (i = 0; i < size; i++) {
        console.log(list[i] + " ");
    }
}

const list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
console.log('Lista original: ');
printList(list, list.length);
modifyList(list);
console.log('Lista modificada: ');
printList(list, list.length);
console.log('Lista invertida: ');
const invertedList = invert(list);
printList(invertedList, invertedList.length);

const list2 = [1, 2, 3, 5, 6, 7, 8, 8, 8, 9, 10, 11];
console.log('Lista original: ');
printList(list2, list2.length);
modifyList(list2);
console.log('Lista modificada: ');
printList(list2, list2.length);
console.log('Lista invertida: ');
const invertedList2 = invert(list2);
printList(invertedList2, invertedList2.length);

const list3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10];
console.log('Lista original: ');
printList(list3, list3.length);
modifyList(list3);
console.log('Lista modificada: ');
printList(list3, list3.length);
console.log('Lista invertida: ');
const invertedList3 = invert(list3);
printList(invertedList3, invertedList3.length);
