var first = true;
    
function back(username) {
    window.location = '../index.jsp?username=' + username
}

function edit(index) {
    if (first) {
        first = false
        document.getElementById('location-' + index).readOnly = false
        document.getElementById('location-' + index).focus()
        document.getElementById('location-' + index).select()
        document.getElementById('edit-' + index).src = 'save.png'
    } else {
        document.getElementById('edit-location-form').submit()
    }
}

function deleteLocation(index) {
    var sure = confirm('Are you sure want to delete this preferred location?')
    if (sure == true) {
        document.getElementById('delete-input').value = index
        document.getElementById('edit-location-form').submit()
    }
}