/* Bubble sort function to sort a list upward */
function bubbleSort(list, n) {
    let i, j, temp;
    let swapped;
    for (i = 0; i < n-1; i++) { /* For each element except the last check */ 
        swapped = false;
        for (j = 0; j < n-i-1; j++) { /* If the left element is grater than right element do swap */
            if (list[j] > list[j+1]) {
                temp = list[j];
                list[j] = list[j+1];
                list[j+1] = temp; /* Helping whith temp var*/
                swapped = true;
            }
        }
        if (swapped === false) { /* If no two elements were swapped in the inner loop, then the list is sorted */
            break;
        }
    }
}

/* Function to print a list */
function printList(list, size) {
    let i;
    for (i = 0; i < size; i++) {
        console.log(list[i] + " ");
    }
}

const list = [122, 34, 0, -1, 22, 11, 0, 14, 77, 86];
const n = list.length;
bubbleSort(list, n);
console.log('Lista ordenada: ');
printList(list, n); 

const list2 = [1, 2, 2, 3, 7, 5, 6, 7, 8, 9, 9, 9, 9, 100, 10];
const n2 = list2.length;
bubbleSort(list2, n2);
console.log('Lista ordenada: ');
printList(list2, n2);

const list3 = [1, 2, 2, 3, 8, 9, 10, 10, 10, 10, 10, -3, 1024];
const n3 = list3.length;
bubbleSort(list3, n3);
console.log('Lista ordenada: ');
printList(list3, n3);