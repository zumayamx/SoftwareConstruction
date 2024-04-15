/* Function to compute the minimum length of a list of strngs */
function minimumLengthList (list) {
    let min = list[0].length;
    for (let i = 1; i < list.length; i++) {  /* If the length of past min string is greater that actual string, update min*/ 
        if (list[i].length < min) {
            min = list[i].length;
        }
    }
    return min;
}

const list = ['hola', 'adios', 'buenos dias', 'buenas noches', ' que hay de nuevo', 'javascript es divertido'];
console.log('La longitud minima de la lista es: ', minimumLengthList(list)); 

const list2 = ['que', 'adios', 'buenos dias', 'buenas noches', ' que hay de nuevo', 'javascript es divertido', 'hola', 'adios'];
console.log('La longitud minima de la lista es: ', minimumLengthList(list2));

const list3 = ['luna', 'sol', 'tierra', 'marte', 'venus', 'mercurio', 'jupiter', 'saturno', 'urano', 'neptuno', 'pluton'];
console.log('La longitud minima de la lista es: ', minimumLengthList(list3));