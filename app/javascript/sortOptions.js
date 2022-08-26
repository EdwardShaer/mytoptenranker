function comparator(a, b) {
    let aVal = a.querySelector('.selector').value;
    let bVal = b.querySelector('.selector').value;

    if (aVal === 'nil')
        return 1;
    if (bVal === 'nil')
        return -1;
    if (aVal == 10)
        return 1;
    if (bVal == 10)
        return -1;
    if (aVal > bVal)
        return 1;
    if (aVal < bVal)
        return -1;
    return 0;
   
}

function sortSelectors(e) {
    var selectors = document.querySelectorAll('.list-item');
    console.log(selectors)
    var selectorsArray = Array.from(selectors);
    let sorted = selectorsArray.sort(comparator);
    console.log(sorted);
    
    sorted.forEach(ele => document.querySelector('#options-list').appendChild(ele));
}