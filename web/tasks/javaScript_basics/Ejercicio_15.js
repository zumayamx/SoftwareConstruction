/* Function to sort a list of numbers */
function sortListNumbers (list) {
    let i, j, temp;
    let swapped;
    for (i = 0; i < list.length-1; i++) { /* For each element except the last check */ 
        swapped = false;
        for (j = 0; j < list.length-i-1; j++) { /* If the left element is grater than right element do swap */
            if (list[j + 1] > list[j]) {
                temp = list[j + 1];
                list[j + 1] = list[j];
                list[j] = temp; /* Helping whith temp var, invert the logic to desc sort*/
                swapped = true;
            }
        }
        if (swapped === false) { /* If no two elements were swapped in the inner loop, then the list is sorted */
            break;
        }
    }
    return list;
}

const list = [122, 34, 0, -1, 22, 11, 0, 14, 77, 86];
console.log('Lista ordenada: ', sortListNumbers(list)); 

const list2 = [1, 2, 2, 3, 7, 5, 6, 7, 8, 9, 9, 9, 9, 100, 10];
console.log('Lista ordenada: ', sortListNumbers(list2));

const list3 = [1, 2, 2, 3, 8, 9, 10, 10, 10, 10, 10, -3, 1024];
console.log('Lista ordenada: ', sortListNumbers(list3));

