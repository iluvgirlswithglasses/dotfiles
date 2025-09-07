
/* @global-vars */
let hrV  = document.getElementById('time-hr'),
    minV = document.getElementById('time-min'),
    secV = document.getElementById('time-sec'),
    sessionV = document.getElementById('time-session');


/* @functions */
function start() {
    let date = new Date();
    timeToString(date);
    setTimeout(recursion, 1000 - date.getMilliseconds());
}

function recursion() {
    let date = new Date();
    timeToString(date);
    setTimeout(recursion, 1000);
}

function timeToString(date) {
    let h = date.getHours(); // 0 - 23
    let m = date.getMinutes(); // 0 - 59
    let s = date.getSeconds(); // 0 - 59
    let session = 'am';
    
    if (h == 0) {
        h = 12;
    }
    
    if (h > 12) {
        h = h - 12;
        session = 'pm';
    }
    
    h = (h < 10) ? '0' + h : '' + h;
    m = (m < 10) ? '0' + m : '' + m;
    s = (s < 10) ? '0' + s : '' + s;
    
    hrV.innerText = h;
    minV.innerText = m;
    secV.innerText = s;
    sessionV.innerText = session;
}

start();

