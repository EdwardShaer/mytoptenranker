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

function sortAndDisable(e) {
    let clicked_selector = e.currentTarget.querySelector('.selector');
    let clicked_value = clicked_selector.value;
    var selectors = document.querySelectorAll('.list-item');
    var selectorsArray = Array.from(selectors);
    let sorted = selectorsArray.sort(comparator);
    let unclickedValue = clicked_selector.dataset.oldValue;
    let enableOldValue = false
    if (unclickedValue !== 'nil') {
        enableOldValue = true;
    };
    
    sorted.forEach(ele => {
        //append each sorted item to the ul
        document.querySelector('#options-list').appendChild(ele);
        let other_selector = ele.querySelector('.selector');
        //disable the selected option for other selectors
        if (other_selector !== clicked_selector){
            other_selector.querySelectorAll('option').forEach(opt => {
                if(enableOldValue && opt.value === unclickedValue){
                    opt.disabled = false;
                };
                if (opt.value === clicked_value){
                opt.disabled = true;
                };
            });
        }
    });
};

function savePreviousValue(e) {
    let focused_selector = e.currentTarget;
    let previous_value = focused_selector.value;
    focused_selector.dataset.oldValue = previous_value;
}

        
