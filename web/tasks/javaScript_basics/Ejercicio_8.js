/* Function to remove duplicates from a list */
function removeDuplicates(list) {
    let newList = [];
    for (let i = 0; i < list.length; i++) {
        if (!newList.includes(list[i])) { /* If the element is not in the new list, add it */
            newList.push(list[i]);
        }
    }
    return newList;
}

const list = [1, 1, 1, 0, 0, 3, 4, 3]
console.log('Lista original: ', list);
const newList = removeDuplicates(list);
console.log('Lista sin duplicados: ', newList);

const list2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
console.log('Lista original: ', list2);
const newList2 = removeDuplicates(list2);
console.log('Lista sin duplicados: ', newList2);

const list3 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
console.log('Lista original: ', list3);
const newList3 = removeDuplicates(list3);
console.log('Lista sin duplicados: ', newList3);