/* Function to sort a list of strings upward, helping to bubble sort */
function sortStringsInList(list) {
    let n = list.length;
    let i, j, temp;
    let swapped;
    
    for (i = 0; i < n-1; i++) {
        swapped = false;
        for (j = 0; j < n-i-1; j++) {
            if (list[j] > list[j+1]) {
                temp = list[j];
                list[j] = list[j+1];
                list[j+1] = temp;
                swapped = true;
            }
        }
        if (swapped === false) {
            break;
        }
    }
    return list;
}

const list = ['hola', 'adios', 'buenos dias', 'buenas noches', 'que hay de nuevo', 'javascript es divertido', 'zorro'];
console.log('La lista ordenada es: ', sortStringsInList(list));

const list2 = ['hola', 'adios', 'buenos dias', 'buenas noches', 'que hay de nuevo', 'javascript es divertido', 'zorro', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'];
console.log('La lista ordenada es: ', sortStringsInList(list2));

const list3 = ['luna', 'sol', 'estrellas', 'planetas', 'satelites', 'cometas', 'asteroides', 'meteoritos'];
console.log('La lista ordenada es: ', sortStringsInList(list3));