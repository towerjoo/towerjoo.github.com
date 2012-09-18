SCROLL_STEP = 20;
isHelpShown = false;
isFocusInInput = false;
function scroll(direction){
	var step;
	if (direction == "up"){
		step = -SCROLL_STEP;
	}
	else{
		step = SCROLL_STEP;
	}
	window.scrollBy(0, step);
}

function gotourl(url){
	window.location.href=url;
}

function showindex(){

}

function showhelp(){
	if (isHelpShown) return;
	document.getElementById("mask").style.display="block";
	document.getElementById("shortcuts_tips").style.display="block";
	isHelpShown = true;
}

function hidehelp(){
	if (!isHelpShown) return;
	document.getElementById("mask").style.display="none";
	document.getElementById("shortcuts_tips").style.display="none";
	isHelpShown = false;
}

function supportNextPrevShortcut(){
	return document.getElementById("nextpost") || document.getElementById("prevpost");
}

function gotoSearch(){
	window.scrollTo(0, 0);
    var elem = document.getElementById("search_input");
    elem.value = "";
    elem.focus();
}
		
function handleShortcut(key){
	if (key == "q"){
		hidehelp();
	}
	if (isHelpShown) return;
	switch(key){
		case "?":
			// show the shortcuts help
			showhelp();
			break;
		case "j":
			scroll("down");
			break;
		case "k":
			scroll("up");
			break;
		case "b":
			window.scrollTo(0, window.document.body.offsetHeight);
			break;
		case "t":
			window.scrollTo(0, 0);
			break;
		case "n":
			if (!supportNextPrevShortcut()){
				alert("This page doesn't support Next/Previous shortcut");
				return;
			}
			if (!document.getElementById("nextpost")){
				alert("This is already the latest one!");
				return;
			}
			var url = document.getElementById("nextpost").href;
			if (url){
				gotourl(url);
			}
			else{
				alert("This is already the latest one!");
			}
			break;
		case "p":
			if (!supportNextPrevShortcut()){
				alert("This page doesn't support Next/Previous shortcut");
				return;
			}
			if (!document.getElementById("prevpost")){
				alert("This is already the oldest one!");
				return;
			}
			var url = document.getElementById("prevpost").href;
			if (url){
				gotourl(url);
			}
			else{
				alert("This is already the oldest one!");
			}
			break;
		case "h":
			gotourl("/");
			break;
		case "a":
			gotourl("/archive.html");
			break;
		case "c":
			gotourl("/category.html");
			break;
		case "i":
			showindex();
			break;
        case  "s":
            gotoSearch();
            break;
	}
}

function shortcuts(e){
    if (isFocusInInput){
        return;
    }
	var x;
	var evtobj = window.event ? event : e;
	x = evtobj.charCode ? evtobj.charCode : evtobj.keyCode;
	var keychar = String.fromCharCode(x);
	handleShortcut(keychar);
}
