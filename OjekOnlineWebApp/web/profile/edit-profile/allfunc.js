function browseFile() {
    document.getElementById('file-selector').click()
}

function obtainFile() {
    document.getElementById('file-path').value = document.getElementById('file-selector').value
}

function back(username) {
    window.location = '../index.jsp?username=' + username
}

function isSuccess(status) {
    if (status == 'ok') {
        alert('Profile has been updated successfully!')
    } else {
        alert('Something went wrong.')
    }
}